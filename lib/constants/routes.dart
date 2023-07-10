import 'package:flutter/material.dart';
import 'package:mylinks/views/screens/settings_screen.dart';
import 'package:mylinks/views/screens/share/active_sharing_screen.dart';
import 'package:mylinks/views/screens/auth/create_password_screen.dart';
import 'package:mylinks/views/screens/auth/forgot_password_screen.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';
import 'package:mylinks/views/screens/auth/register_screen.dart';
import 'package:mylinks/views/screens/home_screen.dart';
import 'package:mylinks/views/screens/onboarding/onboarding_screen.dart';
import 'package:mylinks/views/screens/share/qr_share_screen.dart';
import 'package:mylinks/views/screens/search_screen.dart';

import '../views/screens/onboarding/splash_screen.dart';

class Routes {
  static final routes = <String, Widget Function(BuildContext)>{
    SplashScreen.route: (context) => const SplashScreen(),
    OnBoardingScreen.route: (context) => const OnBoardingScreen(),
    HomeScreen.route: (context) => const HomeScreen(),
    LoginScreen.route: (context) => const LoginScreen(),
    RegisterScreen.route: (context) => const RegisterScreen(),
    ForgotPasswordScreen.route: (context) => const ForgotPasswordScreen(),
    CreatePasswordScreen.route: (context) => const CreatePasswordScreen(),
    SearchScreen.route: (context) => const SearchScreen(),
    QrShareScreen.route: (context) => const QrShareScreen(),
    ActiveSharingScreen.route: (context) => const ActiveSharingScreen(),
    SettingsScreen.route: (context) => const SettingsScreen(),
  };
}
