import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/controllers/search_controller.dart';
import 'package:mylinks/views/screens/profile_screen.dart';
import 'package:mylinks/views/widgets/custom_bottom_nav_bar.dart';
import 'package:mylinks/views/widgets/custom_text_field.dart';
import 'package:mylinks/views/widgets/custon_search_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String route = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: GetBuilder<SearchsController>(
            init: Get.put(SearchsController()),
            builder: (SearchsController controller) {
              return Column(
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: 42,
                    decoration: BoxDecoration(
                        color: AppColors.offWhiteColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            width: 1, color: AppColors.lightGreyColor)),
                    child: CustomTextField(
                      controller: controller.searchController,
                      onSubmitted: (value) {
                        controller.search(controller.searchController.text);
                      },
                      hintText: 'Search',
                      prefixIcon: Icons.search,
                      iconColor: AppColors.lightGreyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  controller.searchList.isEmpty
                      ? const Center(
                          child: Text('Search for users', style: Fonts.m18),
                        )
                      : Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                        ProfileScreen.route,
                                        arguments:
                                            // controller.searchList[index].id,
                                            controller.searchList[index].name
                                                .toString(),
                                      );
                                    },
                                    child: CustomSearchItem(
                                        name:
                                            "${controller.searchList[index].name}"),
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 14,
                                  ),
                              itemCount: controller.searchList.length),
                        ),
                ],
              );
            },
          )),
    );
  }
}
