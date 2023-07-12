import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';

class SettingsController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // create a method to logout the user and navigate to login screen using Get.offAllNamed() and clear the token from the shared preferences using GenericPreferences.remove("token")
  void logout() {
    GenericPreferences.remove("token");
    Get.offAllNamed(LoginScreen.route);
  }
}
