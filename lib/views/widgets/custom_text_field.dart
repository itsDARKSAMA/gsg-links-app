import 'package:flutter/material.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';

class CustomTextField extends StatelessWidget {
  final Color? iconColor;
  final IconData? prefixIcon;
  final String? hintText;

  const CustomTextField({
    this.prefixIcon,
    this.iconColor,
    this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Fonts.r14.copyWith(color: AppColors.greyColor,),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon,color: iconColor,size: 24,),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        hintText: hintText,
      ),
      maxLines: 1,
    );
  }
}
