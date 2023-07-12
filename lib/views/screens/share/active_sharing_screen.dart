import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/controllers/active_sharing_controller.dart';
import 'package:mylinks/views/widgets/custom_bottom_nav_bar.dart';

class ActiveSharingScreen extends StatelessWidget {
  const ActiveSharingScreen({Key? key}) : super(key: key);
  static const String route = '/active_sharing';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Get.arguments['type'] == 'Receiver'
            ? AppColors.primaryGradient
            : null,
        color: Get.arguments['type'] == 'Sender'
            ? AppColors.greenColor
            : AppColors.redColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Active Sharing',
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar.white(),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: GetBuilder<ActiveSharingController>(
                init: Get.put(ActiveSharingController()),
                dispose: (state) {
                  Get.find<ActiveSharingController>().stopSharing();
                },
                builder: (controller) {
                  controller.startSharing(Get.arguments['type']);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${Get.arguments['type']} mode",
                        style: Fonts.b24.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Text(
                        'Please wait while finding your friends',
                        style: Fonts.r10.copyWith(
                          color: AppColors.offWhiteColor,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Lottie.network(
                        "https://assets7.lottiefiles.com/packages/lf20_C7naQNJWjn.json",
                        height: 170,
                        width: 170,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.all(15),
                        width: 270,
                        decoration: BoxDecoration(
                          color: AppColors.offWhiteColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_2,
                              color: AppColors.greyColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                "Mustafa Sehab",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
