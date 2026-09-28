import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:classipod/core/subsonic/subsonic_client.dart';
import 'package:classipod/core/subsonic/subsonic_controller.dart';
import 'package:classipod/features/settings/widgets/subsonic_dialog.dart';
import 'package:classipod/l10n/generated/app_localizations.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class DialogController extends SubsonicController {
  bool _fail = false;
  bool _failScan = false;
  Completer<void>? _scan;
  int _refreshes = 0;
  int _connections = 0;
  String? _password;
  @override
  Future<SubsonicState> build() async => const SubsonicState();
  @override
  Future<void> connect(
    String url,
    String username,
    String password, {
    void Function()? onConnected,
  }) async {
    _connections++;
    if (_fail) throw const SubsonicException('credentials');
    _password = password;
    onConnected?.call();
    state = AsyncData(
      SubsonicState(
        config: SubsonicConfig(url, username, enabled: true),
        signedIn: true,
      ),
    );
    await refresh();
  }

  @override
  Future<void> refresh({bool clearArtwork = false}) async {
    _refreshes++;
    await _scan?.future;
    state = AsyncData(
      SubsonicState(
        config: state.requireValue.config,
        signedIn: true,
        error: _failScan ? 'connection' : null,
      ),
    );
  }
}

void main() {
  late DialogController controller;
  Future<void> open(WidgetTester tester) async {
    controller = DialogController();
    await tester.binding.setSurfaceSize(const Size(320, 480));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    const screenshot = String.fromEnvironment('SUBSONIC_SCREENSHOT');
    if (screenshot.isNotEmpty) {
      final loader = FontLoader('CupertinoSystemText')
        ..addFont(rootBundle.load('assets/fonts/Helvetica.ttf'));
      await loader.load();
      final icons = FontLoader('packages/cupertino_icons/CupertinoIcons')
        ..addFont(
          rootBundle.load('packages/cupertino_icons/assets/CupertinoIcons.ttf'),
        );
      await icons.load();
    }
    await tester.pumpWidget(
      RepaintBoundary(
        key: const Key('capture'),
        child: ProviderScope(
          overrides: [
            subsonicControllerProvider.overrideWith(() => controller),
          ],
          child: CupertinoApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: const [Locale('en')],
            home: Builder(
              builder: (context) => CupertinoPageScaffold(
                child: Center(
                  child: CupertinoButton(
                    onPressed: () => showSubsonicDialog(context),
                    child: const Text('Open'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
  }

  testWidgets('small-screen setup masks password and connects', (tester) async {
    await open(tester);
    expect(tester.takeException(), isNull);
    const screenshot = String.fromEnvironment('SUBSONIC_SCREENSHOT');
    if (screenshot.isNotEmpty) {
      final boundary = tester.renderObject<RenderRepaintBoundary>(
        find.byKey(const Key('capture')),
      );
      await tester.runAsync(() async {
        final image = await boundary.toImage(pixelRatio: 2);
        final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
        await File(screenshot).writeAsBytes(bytes!.buffer.asUint8List());
        image.dispose();
      });
    }
    final password = find.byKey(const Key('subsonic-password'));
    expect(tester.widget<CupertinoTextField>(password).obscureText, isTrue);
    await tester.enterText(
      find.byKey(const Key('subsonic-url')),
      'https://server.test/music',
    );
    await tester.enterText(find.byKey(const Key('subsonic-username')), 'user');
    await tester.enterText(password, 'password');
    await tester.tap(find.text('Connect'));
    await tester.pumpAndSettle();
    expect(controller._connections, 1);
    expect(controller._password, 'password');
    expect(find.byType(SubsonicDialog), findsNothing);
  });

  testWidgets('dialog fields and actions stay above the keyboard', (
    tester,
  ) async {
    await open(tester);
    await tester.binding.setSurfaceSize(const Size(384, 832));
    final password = find.byKey(const Key('subsonic-password'));
    await tester.tap(password);
    tester.view.viewInsets = FakeViewPadding(
      bottom: 359 * tester.view.devicePixelRatio,
    );
    addTearDown(tester.view.resetViewInsets);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    const keyboardTop = 832 - 359;
    expect(tester.getBottomRight(password).dy, lessThan(keyboardTop));
    expect(
      tester.getBottomRight(find.text('Connect')).dy,
      lessThan(keyboardTop),
    );
    await tester.enterText(password, 'password');
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(find.byType(SubsonicDialog), findsNothing);
  });

  testWidgets('waits for indexing then dismisses automatically', (
    tester,
  ) async {
    await open(tester);
    controller._scan = Completer<void>();
    await tester.tap(find.text('Connect'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Loading your library…'), findsOneWidget);
    expect(find.text('Continue in background'), findsOneWidget);
    controller._scan!.complete();
    await tester.pumpAndSettle();
    expect(find.byType(SubsonicDialog), findsNothing);
  });

  testWidgets('background completion does not pop another route', (
    tester,
  ) async {
    await open(tester);
    controller._scan = Completer<void>();
    await tester.tap(find.text('Connect'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    await tester.tap(find.text('Continue in background'));
    await tester.pumpAndSettle();
    expect(find.text('Open'), findsOneWidget);
    // Open a second dialog before the first scan completes.
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    controller._scan!.complete();
    await tester.pumpAndSettle();
    expect(find.byType(SubsonicDialog), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
  });

  testWidgets('scan failure offers retry without another login', (
    tester,
  ) async {
    await open(tester);
    controller._failScan = true;
    await tester.tap(find.text('Connect'));
    await tester.pumpAndSettle();
    expect(find.text('Retry'), findsOneWidget);
    expect(find.text('Close'), findsOneWidget);
    controller._failScan = false;
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();
    expect(controller._connections, 1);
    expect(controller._refreshes, 2);
    expect(find.byType(SubsonicDialog), findsNothing);
  });

  testWidgets('failed login stays in dialog and cancel saves nothing', (
    tester,
  ) async {
    await open(tester);
    controller._fail = true;
    await tester.tap(find.text('Connect'));
    await tester.pumpAndSettle();
    expect(
      find.text('Check your username, password, and server permissions.'),
      findsOneWidget,
    );
    final container = ProviderScope.containerOf(
      tester.element(find.byType(SubsonicDialog)),
    );
    expect(
      container.read(subsonicControllerProvider).requireValue.config,
      isNull,
    );
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(find.byType(SubsonicDialog), findsNothing);
    expect(controller._password, isNull);
  });
}
