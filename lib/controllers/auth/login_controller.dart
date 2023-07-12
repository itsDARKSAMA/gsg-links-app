import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';
import 'package:mylinks/models/user_login_model.dart';
import 'package:mylinks/views/screens/home_screen.dart';
import 'package:mylinks/views/widgets/custom_snackbar.dart';
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
              emailController.clear();
              passwordController.clear();
              // store the token, id, name, and email in the shared preferences using GenericPreferences.setString("token", loginModel!.token!);
              GenericPreferences.setString(
                  "token", "Bearer " + loginModel!.token!);
              GenericPreferences.setInt("id", loginModel!.userData!.id!);
              GenericPreferences.setString("name", loginModel!.userData!.name!);
              GenericPreferences.setString("fcm", loginModel!.userData!.fcm!);
              GenericPreferences.setString(
                  "email", loginModel!.userData!.email!);
              Get.offAllNamed(HomeScreen.route);
              CustomSnackbar(
                title: 'Login Success',
                message: 'Welcome ${loginModel!.userData!.name}',
                type: SnackbarType.success,
              ).show();
            } else {
              const CustomSnackbar(
                title: 'Login Failed',
                message: 'Please try again',
                type: SnackbarType.error,
              ).show();
            }
          }
        }
      }
    }).catchError((error) {
      CustomSnackbar(
        title: 'Login Failed',
        message: error.toString(),
        type: SnackbarType.error,
      ).show();
    });
  }
}
