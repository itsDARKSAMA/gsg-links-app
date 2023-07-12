import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/constants/routes.dart';
import 'package:mylinks/constants/themes.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';
import 'package:mylinks/views/screens/home_screen.dart';
import 'package:mylinks/views/screens/onboarding/splash_screen.dart';

void main() async {
  runApp(const MyApp());
  DioHelper.init();
  GenericPreferences.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Betweener',
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      home: const LoginScreen(),
    );
  }
}
