import 'package:flutter/material.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';

class CustomProfileFollowButton extends StatelessWidget {
  const CustomProfileFollowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
          color: AppColors.greyColor, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          'Follow',
          style: Fonts.b20.copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
