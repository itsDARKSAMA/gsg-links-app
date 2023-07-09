import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          const SizedBox(width: 40,),
          SvgPicture.asset(iconPath),
          const SizedBox(width: 15,),
          Text(buttonName,style: Fonts.sb16.copyWith(
              color: AppColors.whiteColor
          ),
          ),
        ],
      ),
    );
  }
}
