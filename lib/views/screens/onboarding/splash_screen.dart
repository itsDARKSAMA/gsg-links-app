import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';
import 'package:mylinks/views/screens/home_screen.dart';
import 'package:mylinks/views/screens/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const route = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // check if shared preferences has token or not
      // if token is null, go to onboarding screen
      // else go to home screen
      if (GenericPreferences.containsKey('token')) {
        Get.offAllNamed(HomeScreen.route);
      } else {
        if (GenericPreferences.containsKey('onboarding')) {
          Get.offAllNamed(LoginScreen.route);
        } else {
          Get.offAllNamed(OnBoardingScreen.route);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MY',
              style: Fonts.b32.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'LINK',
                style: Fonts.b32.copyWith(color: AppColors.whiteColor),
                children: const <TextSpan>[
                  TextSpan(
                    text: '\n',
                    style: TextStyle(height: 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
