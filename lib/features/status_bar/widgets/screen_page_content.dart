import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class ScreenPageContent extends StatelessWidget {
  final Widget child;

  const ScreenPageContent({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: StatusBar.height),
    child: ClipRect(child: child),
  );
}
