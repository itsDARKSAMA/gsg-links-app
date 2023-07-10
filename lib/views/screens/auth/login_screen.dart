import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/controllers/auth/login_controller.dart';
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
      )),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: GetBuilder<LoginController>(
              init: Get.put(LoginController()),
              builder: (controller) {
                return Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Log in', style: Fonts.b32),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: const Text('Email Address'),
                          prefixIcon: const Icon(Icons.email_outlined),
                          constraints: const BoxConstraints(
                            maxHeight: 50,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          prefixIcon: const Icon(Icons.lock_outlined),
                          constraints: const BoxConstraints(
                            maxHeight: 50,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () => Get.toNamed("/forgot-password"),
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
                            Get.offAllNamed(HomeScreen.route);
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
