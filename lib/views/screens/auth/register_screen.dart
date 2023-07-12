import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/controllers/auth/register_controller.dart';
import 'package:mylinks/views/widgets/primary_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const route = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyLinks',
          style: TextStyle(color: AppColors.primaryColor),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: SingleChildScrollView(
            child: GetBuilder<RegisterController>(
                init: Get.put(RegisterController()),
                builder: (controller) {
                  return Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Sign Up', style: Fonts.b24),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.fullNameTextController,
                          decoration: const InputDecoration(
                            labelText: 'Full Name',
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: controller.emailTextController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: controller.mobileTextController,
                          decoration: const InputDecoration(
                            labelText: 'Mobile',
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          obscureText: true,
                          controller: controller.passwordTextController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          obscureText: true,
                          controller: controller.confirmPasswordTextController,
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                          ),
                        ),
                        const SizedBox(height: 20),
                        PrimaryButton(
                            text: "Sign up",
                            onPressed: () {
                              controller.userRegister(
                                  name: controller.fullNameTextController.text,
                                  email: controller.emailTextController.text,
                                  phone: controller.mobileTextController.text,
                                  password:
                                      controller.passwordTextController.text,
                                  passwordConfirmation: controller
                                      .confirmPasswordTextController.text);
                            }),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Do you have an account? ',
                              style: Fonts.sb15.copyWith(
                                color: AppColors.greyColor,
                              ),
                            ),
                            TextButton(
                              onPressed: controller.signIn,
                              child: const Text('Sign in'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
