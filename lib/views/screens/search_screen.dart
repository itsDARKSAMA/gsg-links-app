import 'package:flutter/material.dart';
import 'package:mylinks/constants/colors.dart';
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
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 42,
              decoration: BoxDecoration(
                  color: AppColors.offWhiteColor,
                  borderRadius: BorderRadius.circular(16),
                  border:
                      Border.all(width: 1, color: AppColors.lightGreyColor)),
              child: const CustomTextField(
                hintText: 'Search',
                prefixIcon: Icons.search,
                iconColor: AppColors.lightGreyColor,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => const CustomSearchItem(),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 14,
                      ),
                  itemCount: 4),
            ),
          ],
        ),
      ),
    );
  }
}
