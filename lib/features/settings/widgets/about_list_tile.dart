import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class AboutListTile extends StatelessWidget {
  final String titleText;
  final String valueText;
  const AboutListTile({
    super.key,
    required this.titleText,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleText,
            style: IpodTypography.title.copyWith(
              color: context.appPrimaryTextColor,
            ),
          ),
          Text(
            valueText,
            style: IpodTypography.title.copyWith(
              color: context.appPrimaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
