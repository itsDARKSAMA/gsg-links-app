import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.image,
    required this.titleAp,
    required this.title,
    required this.subTitle,
  });

  final String image;
  final String titleAp;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 125),
            child: SvgPicture.asset(
              image,
              width: 353,
              height: 353,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              titleAp,
              style: Fonts.m32.copyWith(color: AppColors.primaryColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18, left: 24, right: 40),
            child: Text(
              title,
              style: Fonts.m12.copyWith(color: AppColors.greyColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 24, right: 40),
            child: Text(
              subTitle,
              style: Fonts.m12.copyWith(color: AppColors.greyColor),
            ),
          ),
        ],
      ),
    );
  }
}
