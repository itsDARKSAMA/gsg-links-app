import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';
import 'package:mylinks/models/register_model.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';
import 'package:mylinks/views/screens/home_screen.dart';
import 'dart:developer' as dv;

import 'package:mylinks/views/widgets/custom_snackbar.dart';

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

  RegisterModel? registerModel;

  void userRegister({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String name,
    required String phone,
  }) {
    DioHelper.postData(url: EndPoints.REGISTER, data: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'password_confirmation': passwordConfirmation,
    }).then((response) {
      if (formKey.currentState!.validate()) {
        dv.log(response.data.toString());
        if (response.data != null) {
          registerModel = RegisterModel.fromJson(response.data);
          if (response.statusCode == 200 || response.statusCode == 201) {
            // final isHasToken = registerModel!.token != null;
            if (registerModel!.token != null) {
              const CustomSnackbar(
                title: 'Registered',
                message: 'User Created Successfully',
                type: SnackbarType.success,
              ).show();
              fullNameTextController.clear();
              emailTextController.clear();
              passwordTextController.clear();
              passwordTextController.clear();
              confirmPasswordTextController.clear();
              mobileTextController.clear();
              GenericPreferences.setString(
                  "token", registerModel!.token!.toString());
              Get.offAllNamed(HomeScreen.route);
            } else {
              const CustomSnackbar(
                title: 'Register Failed',
                message: 'Please try again',
                type: SnackbarType.error,
              ).show();
            }
          }
        }
      }
    }).catchError((error) {
      CustomSnackbar(
        title: 'Register Failed',
        message: error.toString(),
        type: SnackbarType.error,
      ).show();
    });
  }

  void signIn() {
    Get.offNamed(LoginScreen.route);
  }
}
