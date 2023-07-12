import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/controllers/delete_active_shere/delete_active_share.dart';
import 'package:mylinks/views/widgets/custom_bottom_nav_bar.dart';

class ActiveSharingScreen extends StatefulWidget {
  const ActiveSharingScreen({Key? key}) : super(key: key);
  static const String route = '/active_sharing';

  @override
  State<ActiveSharingScreen> createState() => _ActiveSharingScreenState();
}

class _ActiveSharingScreenState extends State<ActiveSharingScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    DeleteActiveShareController().deleteActiveShare();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
            ),
          ),
        ),
      ),
    );
  }
}
