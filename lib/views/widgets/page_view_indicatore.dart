import 'package:flutter/material.dart';
import 'package:mylinks/constants/colors.dart';

class PageViewIndicateor extends StatelessWidget {
  const PageViewIndicateor({
    super.key,
    required this.isCurrentPage,
    this.marginEnd = 0,
  });

  final bool isCurrentPage;
  final double marginEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          color: isCurrentPage ? AppColors.primaryColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
