import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/routes.dart';
import 'package:mylinks/constants/themes.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';
import 'package:mylinks/views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyLinks',
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
