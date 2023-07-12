import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/controllers/home_controller.dart';
import 'package:mylinks/controllers/settings_controller.dart';
import 'package:mylinks/views/widgets/custom_bottom_nav_bar.dart';
import 'package:mylinks/views/widgets/primary_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const String route = '/settings';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        init: Get.put(SettingsController()),
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: const CustomBottomNavBar(),
            body: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      margin: const EdgeInsetsDirectional.only(bottom: 50),
                      width: double.infinity,
                      height: 130,
                      color: AppColors.primaryColor,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.network(
                              'https://avatars.githubusercontent.com/u/58864791?v=4',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        IconButton.filled(
                          onPressed: () {},
                          color: AppColors.offWhiteColor,
                          icon: const Icon(Icons.camera_alt_rounded),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Form(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Full Name',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Mobile',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PrimaryButton(text: "Save", onPressed: () {}),
                          const SizedBox(height: 20),
                          PrimaryButton.red(
                              text: "logout",
                              onPressed: () => controller.logout()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
