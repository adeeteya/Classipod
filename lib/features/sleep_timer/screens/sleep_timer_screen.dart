import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/options_list_tile.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:classipod/features/menu/controller/split_screen_controller.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/sleep_timer/models/sleep_timer_model.dart';
import 'package:classipod/features/sleep_timer/provider/sleep_timer_provider.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _SleepTimerOption {
  off,
  fifteenMinutes,
  thirtyMinutes,
  fortyFiveMinutes,
  sixtyMinutes,
  endOfCurrentSong;

  Duration? get duration {
    return switch (this) {
      off || endOfCurrentSong => null,
      fifteenMinutes => const Duration(minutes: 15),
      thirtyMinutes => const Duration(minutes: 30),
      fortyFiveMinutes => const Duration(minutes: 45),
      sixtyMinutes => const Duration(minutes: 60),
    };
  }

  String title(BuildContext context) {
    return switch (this) {
      off => context.localization.tileValueOff,
      fifteenMinutes => context.localization.sleepTimerMinutes(15),
      thirtyMinutes => context.localization.sleepTimerMinutes(30),
      fortyFiveMinutes => context.localization.sleepTimerMinutes(45),
      sixtyMinutes => context.localization.sleepTimerMinutes(60),
      endOfCurrentSong => context.localization.sleepTimerEndOfCurrentSong,
    };
  }
}

class SleepTimerScreen extends ConsumerStatefulWidget {
  const SleepTimerScreen({super.key});

  @override
  ConsumerState createState() => _SleepTimerScreenState();
}

class _SleepTimerScreenState extends ConsumerState<SleepTimerScreen>
    with CustomScreen {
  @override
  String get routeName => Routes.sleepTimer.name;

  @override
  List<_SleepTimerOption> get displayItems => [
    _SleepTimerOption.off,
    _SleepTimerOption.fifteenMinutes,
    _SleepTimerOption.thirtyMinutes,
    _SleepTimerOption.fortyFiveMinutes,
    _SleepTimerOption.sixtyMinutes,
    if (ref.read(nowPlayingDetailsProvider).currentMetadata != null)
      _SleepTimerOption.endOfCurrentSong,
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
          SplitScreenType.sleepTimer;
    });
    final SleepTimerState timerState = ref.read(sleepTimerControllerProvider);
    final _SleepTimerOption activeOption = switch (timerState.mode) {
      SleepTimerMode.off => _SleepTimerOption.off,
      SleepTimerMode.endOfCurrentSong => _SleepTimerOption.endOfCurrentSong,
      SleepTimerMode.fixedDuration => _optionForDuration(timerState.duration),
    };
    final int activeIndex = displayItems.indexOf(activeOption);
    if (activeIndex >= 0) {
      selectedDisplayItem = activeIndex;
    }
  }

  _SleepTimerOption _optionForDuration(Duration? duration) {
    return switch (duration?.inMinutes) {
      15 => _SleepTimerOption.fifteenMinutes,
      30 => _SleepTimerOption.thirtyMinutes,
      45 => _SleepTimerOption.fortyFiveMinutes,
      60 => _SleepTimerOption.sixtyMinutes,
      _ => _SleepTimerOption.off,
    };
  }

  @override
  void onSelectPressed() {
    _selectOption(displayItems[selectedDisplayItem]);
  }

  @override
  void onMenuButtonPressed() {
    ref.read(deviceButtonsServiceProvider.notifier).resetDeviceAction();
    context.pop();
  }

  void _selectOption(_SleepTimerOption option) {
    final SleepTimerController controller = ref.read(
      sleepTimerControllerProvider.notifier,
    );
    switch (option) {
      case _SleepTimerOption.off:
        controller.cancel();
      case _SleepTimerOption.endOfCurrentSong:
        controller.stopAtEndOfCurrentSong();
      case _SleepTimerOption.fifteenMinutes:
      case _SleepTimerOption.thirtyMinutes:
      case _SleepTimerOption.fortyFiveMinutes:
      case _SleepTimerOption.sixtyMinutes:
        controller.start(option.duration!);
    }
    setState(() {
      selectedDisplayItem = displayItems.indexOf(option);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: Routes.sleepTimer.title(context)),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                prototypeItem: const OptionsListTile(
                  text: '',
                  isSelected: false,
                ),
                itemBuilder: (context, index) {
                  return OptionsListTile(
                    text: displayItems[index].title(context),
                    isSelected: index == selectedDisplayItem,
                    onTap: () => _selectOption(displayItems[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
