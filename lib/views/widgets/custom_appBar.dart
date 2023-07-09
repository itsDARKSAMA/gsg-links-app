import 'package:flutter/material.dart';
import 'package:mylinks/constants/fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final String title;
  final Color titleColor;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onPressed;

  const CustomAppBar({
    Key? key,
    required this.backgroundColor,
    required this.title,
    required this.titleColor,
    this.icon,
    this.iconColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      toolbarHeight: 116.0,
      title: Text(
        title,
        style: Fonts.b20.copyWith(
          color: titleColor,
        ),
      ),
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(116.0);
}
