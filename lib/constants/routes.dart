import 'package:flutter/material.dart';
import 'package:mylinks/views/screens/auth/create_password_screen.dart';
import 'package:mylinks/views/screens/auth/forgot_password_screen.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';
import 'package:mylinks/views/screens/auth/register_screen.dart';
import 'package:mylinks/views/screens/home_screen.dart';

class Routes {
  static final routes = <String, Widget Function(BuildContext)>{
    // SplashScreen.route: (context) => const SplashScreen(),
    // OnboardingScreen.route: (context) => const OnboardingScreen(),
    // HomeScreen.route: (context) => const HomeScreen(),
    LoginScreen.route: (context) => const LoginScreen(),
    RegisterScreen.route: (context) => const RegisterScreen(),
    ForgotPasswordScreen.route: (context) => const ForgotPasswordScreen(),
    CreatePasswordScreen.route: (context) => const CreatePasswordScreen(),
  };
}
