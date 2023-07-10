import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/views/widgets/custom_appBar.dart';
import 'package:mylinks/views/widgets/custom_text_field.dart';

class ActiveSharingScreen extends StatelessWidget {
  const ActiveSharingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          backgroundColor: Colors.transparent,
          title: 'Active Sharing',
          titleColor: AppColors.whiteColor,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/sharing_icon.svg',width: 120),
                const SizedBox(height: 30,),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const CustomTextField(
                      prefixIcon: Icons.person,
                      iconColor: AppColors.greyColor
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

