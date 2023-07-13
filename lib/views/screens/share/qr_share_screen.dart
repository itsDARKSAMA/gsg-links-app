import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';
import 'package:mylinks/views/widgets/custom_bottom_nav_bar.dart';
import 'package:mylinks/views/widgets/custom_qr_card.dart';

class QrShareScreen extends StatelessWidget {
  const QrShareScreen({Key? key}) : super(key: key);
  static const String route = '/qr_share';

  @override
  Widget build(BuildContext context) {
    if (!GenericPreferences.containsKey("token")) {
      Get.offAllNamed(
        LoginScreen.route,
      );
    }
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Share QR',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          leading: null,
        ),
        bottomNavigationBar: CustomBottomNavBar.white(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomQrCard(qrData: '1234567'),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                GenericPreferences.getString('name'),
                style: Fonts.sb16.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
