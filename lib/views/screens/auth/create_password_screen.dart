import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/controllers/auth/create_password_controller.dart';
import 'package:mylinks/views/widgets/primary_button.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});
  static const route = '/create-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Password',
        ),
        leading: IconButton(
            onPressed: () => Get.back,
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Center(
        child: GetBuilder<CreatePasswordController>(
            init: Get.put(CreatePasswordController()),
            builder: (controller) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Create Password', style: Fonts.sb20),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Create your new password to login',
                        style: Fonts.r15.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.passwordTextController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                          label: Text('Password'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.confirmPasswordTextController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                          label: Text('Confirm Password'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: PrimaryButton(
                              text: "Create New Password", onPressed: () {})),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
