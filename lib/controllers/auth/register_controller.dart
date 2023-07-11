import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';
import 'package:mylinks/models/register_model.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';
import 'package:mylinks/views/screens/home_screen.dart';
import 'dart:developer' as dv;
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
    required String password_confirmation,
    required String name,
    required String phone,
  }) {
    DioHelper.postData(url: EndPoints.REGISTER, data: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'password_confirmation': password_confirmation,
    }).then((response) {
      if (formKey.currentState!.validate()) {
        dv.log(response.data.toString());
        if (response.data != null) {
          registerModel = RegisterModel.fromJson(response.data);
          if (response.statusCode == 200 || response.statusCode == 201) {
            final isHasToken = registerModel!.token != null;
            if (isHasToken == true) {
              Get.snackbar(
                "Registered",
                "User Created Successfully",
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
              fullNameTextController.clear();
              emailTextController.clear();
              passwordTextController.clear();
              passwordTextController.clear();
              confirmPasswordTextController.clear();
              mobileTextController.clear();
              Get.offAllNamed(HomeScreen.route);
            } else {
              Get.snackbar(
                "Failed",
                "something wrong",
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          }
        }
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void signIn() {
    Get.offNamed(LoginScreen.route);
  }
}
