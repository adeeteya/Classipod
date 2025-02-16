import 'package:classipod/classipod_app.dart';
import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/features/app_startup/screens/app_startup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppPalette.transparentColor,
      statusBarColor: AppPalette.transparentColor,
    ),
  );

  runApp(
    const ProviderScope(
      child: AppStartupScreen(
        app: ClassipodApp(),
      ),
    ),
  );
}
