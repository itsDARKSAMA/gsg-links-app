import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mylinks/constants/colors.dart';

import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/controllers/active_sharing_controller.dart';
import 'package:mylinks/controllers/delete_active_shere/delete_active_share.dart';
import 'package:mylinks/controllers/user_active_share_controller/user_active_share_nearest_controller.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';
import 'package:mylinks/views/widgets/custom_bottom_nav_bar.dart';

class ActiveSharingScreen extends StatefulWidget {
  const ActiveSharingScreen({Key? key}) : super(key: key);
  static const String route = '/active_sharing';

  @override
  State<ActiveSharingScreen> createState() => _ActiveSharingScreenState();
}

class _ActiveSharingScreenState extends State<ActiveSharingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!GenericPreferences.containsKey("token")) {
      Get.offAllNamed(
        LoginScreen.route,
      );
    }
  }

  @override
  void dispose() {
    DeleteActiveShareController().deleteActiveShare();
    super.dispose();
  }

  final controller = UserActiveSharController();
  bool dataLoaded = false;

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
// 22-create-active-sharing-set-active-sharing-api-request
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
//=======
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Lottie.network(
//                     "https://assets7.lottiefiles.com/packages/lf20_C7naQNJWjn.json",
//                     height: 170,
//                     width: 170,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       dataLoaded = false;
//                     });
//                     controller.getUserActiveSharSender().then((_) {
//                       setState(() {
//                         dataLoaded = true;
//                       });
//                     });
//                   },
//                   child: const Text('Start'),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 if (dataLoaded)
//                   Expanded(
//                     child: FutureBuilder<List<dynamic>>(
//                       future: controller.getUserActiveSharSender(),
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return CircularProgressIndicator();
//                         } else if (snapshot.hasError) {
//                           return Text('Error: ${snapshot.error}');
//                         } else {
//                           List<dynamic> dataList = snapshot.data ?? [];
//                           return ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: dataList.length,
//                             itemBuilder: (context, index) {
//                               final user = dataList[index]['user'];
//                               return Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Container(
//                                   height: 50,
//                                   padding: const EdgeInsets.all(15),
//                                   width: 270,
//                                   decoration: BoxDecoration(
//                                     color: AppColors.offWhiteColor,
//                                     borderRadius: BorderRadius.circular(16),
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.person_2,
//                                         color: AppColors.greyColor,
//                                       ),
//                                       const SizedBox(
//                                         width: 10,
//                                       ),
//                                       SizedBox(
//                                         width: 200,
//                                         child: Text(
//                                           user['name'] ?? 'no data',
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         }
//                       },
//                     ),
//                   ),
//               ],
//             ),
// //>>>>>>> main
          ),
        ),
      ),
    );
  }
}
