import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/controllers/auth/forgot_password_controller.dart';
import 'package:mylinks/views/widgets/primary_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  static const route = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        leading: IconButton(
          onPressed: () => Get.back,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: GetBuilder<ForgotPasswordController>(
              init: Get.put(ForgotPasswordController()),
              builder: (controller) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Create Password', style: Fonts.sb24),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'no worries, you just need to type your email address or username and we will send the verification code.',
                      style: Fonts.r15.copyWith(
                        color: AppColors.greyColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text('Email Address'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimaryButton(text: "Reset Password", onPressed: () {}),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
