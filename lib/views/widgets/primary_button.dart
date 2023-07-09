import 'package:flutter/material.dart';
import 'package:mylinks/constants/fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
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
