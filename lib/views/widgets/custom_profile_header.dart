import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/images.dart';

class CustomProfileHeader extends StatelessWidget {
  const CustomProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 116,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: AppColors.primaryGradient,
          ),
        ),
        Positioned(
          top: 75,
          child: Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 4, color: AppColors.whiteColor),
              image: const DecorationImage(
                image: AssetImage(Images.avatar),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: 16,
          top: 45,
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.whiteColor,
            ),
          ),
        )
      ],
    );
  }
}
