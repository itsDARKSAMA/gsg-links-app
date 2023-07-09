import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    this.isWhite = false,
  });

  final bool isWhite;

  factory CustomBottomNavBar.white() {
    return const CustomBottomNavBar(
      isWhite: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
        init: Get.put(BottomNavBarController()),
        builder: (controller) {
          return BottomAppBar(
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomBottomNavElement(
                    index: 0,
                    isWhite: isWhite,
                    currentIndex: controller.currentIndex,
                    onTap: () => controller.changeIndex(0),
                    icon: Icons.home,
                    title: 'Home',
                  ),
                ),
                Expanded(
                  child: CustomBottomNavElement(
                    index: 1,
                    isWhite: isWhite,
                    currentIndex: controller.currentIndex,
                    onTap: () => controller.changeIndex(1),
                    icon: Icons.search_rounded,
                    title: 'Search',
                  ),
                ),
                Expanded(
                  child: FloatingActionButton(
                    shape: const CircleBorder(),
                    onPressed: () {
                      controller.changeIndex(2);
                    },
                    child: const Icon(Icons.emergency_share_rounded),
                  ),
                ),
                Expanded(
                  child: CustomBottomNavElement(
                    index: 3,
                    isWhite: isWhite,
                    currentIndex: controller.currentIndex,
                    onTap: () => controller.changeIndex(3),
                    icon: Icons.qr_code_scanner_rounded,
                    title: 'Scan',
                  ),
                ),
                Expanded(
                  child: CustomBottomNavElement(
                    index: 4,
                    isWhite: isWhite,
                    currentIndex: controller.currentIndex,
                    onTap: () {
                      controller.changeIndex(4);
                    },
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class CustomBottomNavElement extends StatelessWidget {
  const CustomBottomNavElement({
    super.key,
    required this.index,
    required this.isWhite,
    required this.currentIndex,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  // [index] is the index of the element
  final int index;
  // [currentIndex] is the index of the current screen
  final int currentIndex;
  final bool isWhite;
  final Function() onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: AppColors.primaryColor.withOpacity(0.05),
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: index == currentIndex
                ? AppColors.primaryColor
                : isWhite
                    ? AppColors.whiteColor
                    : AppColors.greyColor,
          ),
          Text(
            title,
            style: Fonts.r12.copyWith(
              color: index == currentIndex
                  ? AppColors.primaryColor
                  : isWhite
                      ? AppColors.whiteColor
                      : AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBarController extends GetxController {
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    update();
  }
}
