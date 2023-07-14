import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/controllers/auth/login_controller.dart';
import 'package:mylinks/views/screens/auth/forgot_password_screen.dart';
import 'package:mylinks/views/screens/auth/register_screen.dart';
import 'package:mylinks/views/screens/home_screen.dart';
import 'package:mylinks/views/widgets/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyLinks',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        leading: null,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: GetBuilder<LoginController>(
              init: Get.put(LoginController()),
              builder: (controller) {
                // if (GenericPreferences.containsKey("token")) {
                //   Get.offAllNamed(
                //     HomeScreen.route,
                //   );
                // }
                return Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Log in', style: Fonts.b32),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          labelText: "Email Address",
                          constraints: BoxConstraints(
                            maxHeight: 50,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: controller.passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          constraints: BoxConstraints(
                            maxHeight: 50,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () =>
                              Get.toNamed(ForgotPasswordScreen.route),
                          child: const Text(
                            'Forgot Password?',
                            style: Fonts.m16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryButton(
                          text: "Login",
                          onPressed: () {
                            controller.userLogin(
                              email: controller.emailController.text,
                              password: controller.passwordController.text,
                            );
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account? ',
                            style:
                                Fonts.sb15.copyWith(color: AppColors.greyColor),
                          ),
                          TextButton(
                            onPressed: () => Get.offNamed(RegisterScreen.route),
                            child: const Text('Sign Up', style: Fonts.sb15),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
