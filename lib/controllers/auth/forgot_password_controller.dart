import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final emailTextController = TextEditingController();

  @override
  void onClose() {
    emailTextController.dispose();
    super.onClose();
  }
}
