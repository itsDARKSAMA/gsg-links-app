import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/views/screens/link_screen/add_new_link_screen.dart';
import 'package:mylinks/views/screens/link_screen/edit_link_screen.dart';
import 'package:mylinks/views/screens/onboarding/onboarding_screen.dart';
import 'package:mylinks/views/screens/onboarding/splash_screen.dart';
import 'package:mylinks/views/screens/settings_screen.dart';
import 'package:mylinks/views/screens/share/active_sharing_screen.dart';
import 'package:mylinks/views/screens/auth/create_password_screen.dart';
import 'package:mylinks/views/screens/auth/forgot_password_screen.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';
import 'package:mylinks/views/screens/auth/register_screen.dart';
import 'package:mylinks/views/screens/home_screen.dart';
import 'package:mylinks/views/screens/share/qr_share_screen.dart';
import 'package:mylinks/views/screens/search_screen.dart';

class Routes {
  static const Transition _transtion = Transition.fadeIn;
  static List<GetPage<dynamic>> customPages = [
    GetPage(
      name: SplashScreen.route,
      page: () => const SplashScreen(),
      transition: _transtion,
    ),
    GetPage(
      name: HomeScreen.route,
      page: () => const HomeScreen(),
      transition: _transtion,
    ),
    GetPage(
      name: OnBoardingScreen.route,
      page: () => const OnBoardingScreen(),
      transition: _transtion,
    ),
    GetPage(
      name: LoginScreen.route,
      page: () => const LoginScreen(),
      transition: _transtion,
    ),
    GetPage(
      name: RegisterScreen.route,
      page: () => const RegisterScreen(),
      transition: _transtion,
    ),
    GetPage(
      name: ForgotPasswordScreen.route,
      page: () => const ForgotPasswordScreen(),
      transition: _transtion,
    ),
    GetPage(
      name: CreatePasswordScreen.route,
      page: () => const CreatePasswordScreen(),
      transition: _transtion,
    ),
    GetPage(
      name: SearchScreen.route,
      page: () => const SearchScreen(),
      transition: _transtion,
    ),
    GetPage(
      name: QrShareScreen.route,
      page: () => const QrShareScreen(),
      transition: _transtion,
    ),
    GetPage(
      name: ActiveSharingScreen.route,
      page: () => const ActiveSharingScreen(),
      transition: _transtion,
    ),
    GetPage(
      name: SettingsScreen.route,
      page: () => const SettingsScreen(),
      transition: _transtion,
    ),
    GetPage(
      name: EditLinkScreen.route,
      page: () => const EditLinkScreen(),
      transition: _transtion,
    ),
    GetPage(
      name: AddNewLinkScreen.route,
      page: () => const AddNewLinkScreen(),
      transition: _transtion,
    ),
  ];
}
