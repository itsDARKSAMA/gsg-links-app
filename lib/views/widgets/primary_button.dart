import 'package:flutter/material.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });

  final String text;
  final Function() onPressed;
  final Color? color;

  factory PrimaryButton.red({
    required String text,
    required Function() onPressed,
  }) {
    return PrimaryButton(
      text: text,
      onPressed: onPressed,
      color: AppColors.redColor,
    );
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 60),
      ),
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: Fonts.b17,
      ),
    );
  }
}
