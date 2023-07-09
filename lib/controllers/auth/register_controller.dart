import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';

class RegisterController extends GetxController {
  final fullNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final mobileTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    fullNameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    mobileTextController.dispose();
    super.onClose();
  }

  void register() {
    if (formKey.currentState!.validate()) {
      // implemt register logic here
      Get.offAllNamed(LoginScreen.route);
    }
  }

  void signIn() {
    Get.offNamed(LoginScreen.route);
  }
}
