import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';

class CustomSnackbar {
  final String title;
  final String message;
  final SnackbarType type;

  const CustomSnackbar({
    required this.title,
    required this.message,
    required this.type,
  });

  void show() => Get.snackbar(
        title,
        message,
        backgroundColor: _getBackgroundColor(type),
        colorText: AppColors.whiteColor,
      );

  Color _getBackgroundColor(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return AppColors.greenColor;
      case SnackbarType.error:
        return AppColors.redColor;
      case SnackbarType.warning:
        return AppColors.orangeColor;
      case SnackbarType.info:
        return AppColors.yellowColor;
      case SnackbarType.defaultType:
        return AppColors.lightGreyColor;
      default:
        return AppColors.lightGreyColor;
    }
  }
}

enum SnackbarType {
  success,
  error,
  warning,
  info,
  defaultType,
}
