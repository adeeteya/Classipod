import 'package:classipod/features/settings/models/exclude_directory_model.dart';
import 'package:classipod/features/settings/widgets/exclude_directory_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

ExcludeDirectoryModel _model(String path, {required bool isExcluded}) {
  return ExcludeDirectoryModel(directoryPath: path, isExcluded: isExcluded);
}

Widget _wrap(Widget child) {
  return CupertinoApp(home: CupertinoPageScaffold(child: child));
}

void main() {
  group('ExcludeDirectoryTile states', () {
    const String path = '/storage/emulated/0/Music/Albums';

    testWidgets('included directory shows green checkmark', (tester) async {
      await tester.pumpWidget(
        _wrap(
          ExcludeDirectoryTile(
            excludeDirectoryModel: _model(path, isExcluded: false),
            isSelected: false,
            onTap: () {},
          ),
        ),
      );
      expect(
        find.byIcon(CupertinoIcons.checkmark_alt_circle_fill),
        findsOneWidget,
      );
      expect(find.byIcon(CupertinoIcons.xmark_square_fill), findsNothing);
      expect(find.byIcon(CupertinoIcons.minus_circle), findsNothing);
    });

    testWidgets('toggled-off directory shows xmark', (tester) async {
      await tester.pumpWidget(
        _wrap(
          ExcludeDirectoryTile(
            excludeDirectoryModel: _model(path, isExcluded: true),
            isSelected: false,
            onTap: () {},
          ),
        ),
      );
      expect(find.byIcon(CupertinoIcons.xmark_square_fill), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.minus_circle), findsNothing);
    });

    testWidgets('name-filtered directory shows minus circle', (tester) async {
      await tester.pumpWidget(
        _wrap(
          ExcludeDirectoryTile(
            excludeDirectoryModel: _model(path, isExcluded: false),
            isSelected: false,
            nameFilters: const ['albums'],
            onTap: () {},
          ),
        ),
      );
      expect(find.byIcon(CupertinoIcons.minus_circle), findsOneWidget);
      expect(
        find.byIcon(CupertinoIcons.checkmark_alt_circle_fill),
        findsNothing,
      );
    });

    testWidgets('toggled-off wins over name filter', (tester) async {
      await tester.pumpWidget(
        _wrap(
          ExcludeDirectoryTile(
            excludeDirectoryModel: _model(path, isExcluded: true),
            isSelected: false,
            nameFilters: const ['albums'],
            onTap: () {},
          ),
        ),
      );
      expect(find.byIcon(CupertinoIcons.xmark_square_fill), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.minus_circle), findsNothing);
    });
  });
}
