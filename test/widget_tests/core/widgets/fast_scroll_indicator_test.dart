import 'package:classipod/core/widgets/fast_scroll_indicator.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const badge = ValueKey('fast-scroll-letter');
  late ValueNotifier<int> wheelIndex;
  late ScrollController controller;

  setUp(() {
    wheelIndex = ValueNotifier(-1);
    controller = ScrollController();
  });

  tearDown(() {
    wheelIndex.dispose();
    controller.dispose();
  });

  Future<void> buildList(
    WidgetTester tester, {
    Brightness brightness = Brightness.light,
  }) async {
    await tester.pumpWidget(
      CupertinoApp(
        theme: CupertinoThemeData(brightness: brightness),
        home: FastScrollIndicator(
          wheelScrollIndex: wheelIndex,
          itemCount: 100,
          itemExtent: 30,
          labelAt: (index) => index == 0
              ? ''
              : index < 5
              ? '99 songs'
              : 'banana',
          child: ListView.builder(
            controller: controller,
            itemExtent: 30,
            itemCount: 100,
            itemBuilder: (_, index) => Text('Row $index'),
          ),
        ),
      ),
    );
  }

  testWidgets(
    'slow wheel movement stays hidden; rapid movement groups digits',
    (tester) async {
      await buildList(tester);
      for (var index = 0; index < 3; index++) {
        wheelIndex.value = index;
        await tester.pump(const Duration(milliseconds: 250));
        expect(find.byKey(badge), findsNothing);
      }
      for (var index = 3; index <= 14; index++) {
        wheelIndex.value = index;
        await tester.pump(const Duration(milliseconds: 10));
        if (index < 14) expect(find.byKey(badge), findsNothing);
      }
      expect(tester.widget<Text>(find.byKey(badge)).data, 'B');
      wheelIndex.value = 4;
      await tester.pump();
      final text = tester.widget<Text>(find.byKey(badge));
      expect(text.data, '123');
      expect(text.style!.color, CupertinoColors.white);
      final container = tester.widget<Container>(
        find.ancestor(of: find.byKey(badge), matching: find.byType(Container)),
      );
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, CupertinoColors.black);
      expect(decoration.borderRadius, BorderRadius.circular(8));
      expect(tester.getCenter(find.byKey(badge)), const Offset(400, 300));
      await tester.pump(const Duration(milliseconds: 651));
      expect(find.byKey(badge), findsNothing);
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );

  testWidgets('fast touch scrolling follows visible rows and hides on pause', (
    tester,
  ) async {
    await buildList(tester);
    await tester.timedDrag(
      find.byType(ListView),
      const Offset(0, -600),
      const Duration(milliseconds: 150),
    );
    await tester.pump();
    expect(tester.widget<Text>(find.byKey(badge)).data, 'B');
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 651));
    expect(find.byKey(badge), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('ordinary wheel scrolling and brief bursts stay hidden', (
    tester,
  ) async {
    await buildList(tester);
    for (var index = 1; index <= 20; index++) {
      wheelIndex.value = index;
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.byKey(badge), findsNothing);
    }
    await tester.pump(const Duration(milliseconds: 250));
    for (var index = 21; index <= 23; index++) {
      wheelIndex.value = index;
      await tester.pump(const Duration(milliseconds: 10));
      expect(find.byKey(badge), findsNothing);
    }
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('ordinary touch scrolling stays hidden', (tester) async {
    await buildList(tester);
    final gesture = await tester.startGesture(const Offset(400, 500));
    for (var step = 0; step < 20; step++) {
      await gesture.moveBy(const Offset(0, -15));
      await tester.pump(const Duration(milliseconds: 25));
      expect(find.byKey(badge), findsNothing);
    }
    await gesture.up();
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('slowing down dismisses the badge even while still scrolling', (
    tester,
  ) async {
    await buildList(tester);
    for (var index = 1; index <= 12; index++) {
      wheelIndex.value = index;
      await tester.pump(const Duration(milliseconds: 10));
    }
    expect(find.byKey(badge), findsOneWidget);
    for (var index = 13; index <= 24; index++) {
      wheelIndex.value = index;
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(find.byKey(badge), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('programmatic jumps do not trigger the badge', (tester) async {
    await buildList(tester);
    controller.jumpTo(900);
    await tester.pump();
    expect(find.byKey(badge), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('dark mode has inverse colors and disposal cancels timers', (
    tester,
  ) async {
    await buildList(tester, brightness: Brightness.dark);
    for (var index = 1; index <= 12; index++) {
      wheelIndex.value = index;
      await tester.pump(const Duration(milliseconds: 10));
    }
    expect(
      tester.widget<Text>(find.byKey(badge)).style!.color,
      CupertinoColors.black,
    );
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 1));
    expect(tester.takeException(), isNull);
  });
}
