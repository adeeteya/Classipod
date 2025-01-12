import 'package:classipod/core/constants.dart';
import 'package:classipod/features/app_startup/app_startup_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: transparentColor,
      statusBarColor: transparentColor,
    ),
  );

  runApp(
    const ProviderScope(
      child: AppStartupWidget(),
    ),
  );
}
