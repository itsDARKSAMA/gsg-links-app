import 'package:flutter/material.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';

class CustomFollowNumbers extends StatelessWidget {
  // final int? number;
  final String followName;
  const CustomFollowNumbers({
    // this.number,
    required this.followName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 75,
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "N/A",
            style: Fonts.b24.copyWith(color: AppColors.whiteColor),
          ),
          Text(
            followName,
            style: Fonts.r16.copyWith(color: AppColors.offWhiteColor),
          ),
        ],
      ),
    );
  }
}
