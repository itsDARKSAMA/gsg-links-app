import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/views/widgets/custom_follow_numbers.dart';
import 'package:mylinks/views/widgets/custom_profile_follow_button.dart';
import 'package:mylinks/views/widgets/custom_profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String route = '/profile';

  @override
  Widget build(BuildContext context) {
    if (Get.arguments == null) Get.back();

    return Scaffold(
      body: Column(
        children: [
          const CustomProfileHeader(),
          const SizedBox(
            height: 60,
          ),
          Text(
            Get.arguments,
            style: Fonts.sb16,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomFollowNumbers(followName: 'Followers'),
                    CustomFollowNumbers(followName: 'Following'),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                CustomProfileFollowButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
