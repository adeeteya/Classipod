import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeviceScreen extends ConsumerWidget {
  final Widget child;

  const DeviceScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTouchScreenEnabled = ref.watch(
      settingsPreferencesControllerProvider.select(
        (e) => e.isTouchScreenEnabled,
      ),
    );

    final size = MediaQuery.sizeOf(context);

    return AbsorbPointer(
      absorbing: !isTouchScreenEnabled,
      child: Container(
        height: Constants.screenHeight + 10,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.appDeviceScreenBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.appDeviceScreenBorderColor,
            width: 5,
          ),
        ),
        child: MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(size: Size(size.width - 40 - 10, Constants.screenHeight)),
          child: child,
        ),
      ),
    );
  }
}
