import 'package:flutter/material.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';

class CustomSocailMediaButton extends StatelessWidget {
  final String buttonName;
  final String iconPath;
  const CustomSocailMediaButton({
    required this.buttonName,
    required this.iconPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
          color: AppColors.offWhiteColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No Links",
            style: Fonts.sb16.copyWith(color: AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}
