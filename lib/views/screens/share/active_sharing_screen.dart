import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/controllers/user_active_share_controller/user_active_share_nearest_controller.dart';
import 'package:mylinks/views/widgets/custom_bottom_nav_bar.dart';

class ActiveSharingScreen extends StatefulWidget {
  const ActiveSharingScreen({Key? key}) : super(key: key);
  static const String route = '/active_sharing';

  @override
  State<ActiveSharingScreen> createState() => _ActiveSharingScreenState();
}

class _ActiveSharingScreenState extends State<ActiveSharingScreen> {
  final controller = UserActiveSharController();
  bool dataLoaded = false;

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
                Expanded(
                  child: Lottie.network(
                    "https://assets7.lottiefiles.com/packages/lf20_C7naQNJWjn.json",
                    height: 170,
                    width: 170,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      dataLoaded = false;
                    });
                    controller.getUserActiveSharSender().then((_) {
                      setState(() {
                        dataLoaded = true;
                      });
                    });
                  },
                  child: const Text('Start'),
                ),
                const SizedBox(
                  height: 30,
                ),
                if (dataLoaded)
                  Expanded(
                    child: FutureBuilder<List<dynamic>>(
                      future: controller.getUserActiveSharSender(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          List<dynamic> dataList = snapshot.data ?? [];
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: dataList.length,
                            itemBuilder: (context, index) {
                              final user = dataList[index]['user'];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.all(15),
                                  width: 270,
                                  decoration: BoxDecoration(
                                    color: AppColors.offWhiteColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person_2,
                                        color: AppColors.greyColor,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          user['name'] ?? 'no data',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
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
