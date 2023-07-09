import 'package:flutter/material.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/on_boarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(gradient: AppColors.primaryGradient),
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
