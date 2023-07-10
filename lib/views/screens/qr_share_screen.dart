import 'package:flutter/material.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/views/widgets/custom_appBar.dart';
import 'package:mylinks/views/widgets/custom_qr_card.dart';

class QrShareScreen extends StatelessWidget {
  const QrShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          backgroundColor: Colors.transparent,
          title: 'Share QR',
          titleColor: AppColors.whiteColor,
          icon: Icons.arrow_back_ios_new_rounded,
          iconColor: Colors.white,
          onPressed: () {},
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomQrCard(qrData: '1234567'),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Abdelrahman Almajayda',
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
