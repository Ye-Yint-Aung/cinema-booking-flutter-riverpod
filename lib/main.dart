import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/providers/settings/dark_mode_provider.dart';
import 'package:riverpod_demo/providers/settings/language_provider.dart';
import 'package:riverpod_demo/themes/color_schemes.dart';

import 'screens/main_home/main_home.dart';

final navigatorKey = GlobalKey<NavigatorState>();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      path: 'assets/language',
      supportedLocales: const [Locale('en', 'US'), Locale('my', 'MM')],
      fallbackLocale: const Locale('en', 'US'),
      child: const ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeProvider);
    var language = ref.watch(languageProvider);
    return MaterialApp(
      // Language
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: language ? const Locale('en', 'US') : const Locale('my', 'MM'),
      //
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkMode ? darkTheme : lightTheme,
      darkTheme: darkMode ? darkTheme : lightTheme,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      home: MainHomeScreen(),
    );
  }
}
// #####
