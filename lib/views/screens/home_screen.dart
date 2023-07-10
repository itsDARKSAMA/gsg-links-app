import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/controllers/home_controller.dart';
import 'package:mylinks/views/screens/link_screen/add_link_screen.dart';
import 'package:mylinks/views/screens/link_screen/edit_link_screen.dart';
import 'package:mylinks/views/widgets/custom_bottom_nav_bar.dart';
import 'package:mylinks/views/widgets/link_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: Get.put(HomeController()),
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: const CustomBottomNavBar(),
            body: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      margin: const EdgeInsetsDirectional.only(bottom: 50),
                      width: double.infinity,
                      height: 130,
                      color: AppColors.primaryColor,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.network(
                              'https://avatars.githubusercontent.com/u/58864791?v=4',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      Text(
                        controller.username,
                        style: Fonts.sb16,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.secondaryColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.followers,
                                  style: Fonts.b24.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  'Followers',
                                  style: Fonts.r16.copyWith(
                                    color: AppColors.offWhiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Container(
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.secondaryColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.following,
                                  style: Fonts.b24.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  'Following',
                                  style: Fonts.r16.copyWith(
                                    color: AppColors.offWhiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.grey[300],
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: LinkCard(
                            title: 'Facebook',
                            icon: Icons.facebook,
                            onTap: () {},
                            onEdit: (context) =>
                                Get.toNamed(EditLinkScreen.route),
                            onDelete: (context) {},
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Get.toNamed(AddLinkScreen.route),
              child: const Icon(
                Icons.add,
                color: AppColors.whiteColor,
              ),
            ),
          );
        });
  }
}
