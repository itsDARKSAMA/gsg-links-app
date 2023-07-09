import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';

class CreatePasswordController extends GetxController {
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    super.onClose();
  }

  void createPassword() {
    if (formKey.currentState!.validate()) {
      // implemt create password logic here
      Get.offAllNamed(LoginScreen.route);
    }
  }
}
