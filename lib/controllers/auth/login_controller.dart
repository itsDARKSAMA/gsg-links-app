import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';
import 'package:mylinks/models/user_login_model.dart';
import 'package:mylinks/views/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final prefs = SharedPreferences.getInstance();

  UserLoginModel? loginModel;

  void userLogin({required String email, required String password}) {
    DioHelper.postData(url: EndPoints.LOGIN, data: {
      'email': email,
      'password': password,
    }).then((response) async {
      if (formKey.currentState!.validate()) {
      if (response.data != null) {
        loginModel = UserLoginModel.fromJson(response.data);

        if (response.statusCode == 200) {
          final isHasToken = loginModel!.token != null;
          if (isHasToken == true) {
            Get.snackbar(
              "Login",
              "Successfully Login",
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
            emailController.clear();
            passwordController.clear();
            Get.offAllNamed(HomeScreen.route);
          } else {
            Get.snackbar(
              "Failed",
              "Login Failed",
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        }
      }}
    }).catchError((error) {
      print(error.toString());
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
