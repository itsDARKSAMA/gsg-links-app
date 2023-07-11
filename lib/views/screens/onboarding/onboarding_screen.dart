import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/constants/images.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';
import 'package:mylinks/views/widgets/on_bording_widget.dart';
import 'package:mylinks/views/widgets/page_view_indicatore.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const route = '/onboarding';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    if (GenericPreferences.containsKey('onboarding')) {
      Get.offNamed(LoginScreen.route);
    }
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int currentPage) {
                  setState(() {
                    _currentPage = currentPage;
                  });
                },
                children: const [
                  OnBoardingWidget(
                      image: Images.ob1,
                      titleAp: "Lorem Ipsum",
                      title: "Lorem ipsum dolor sit amet ",
                      subTitle: " consectetur. Est in sit in non."),
                  OnBoardingWidget(
                      image: Images.ob2,
                      titleAp: "Lorem Ipsum",
                      title: "Lorem ipsum dolor sit amet ",
                      subTitle: " consectetur. Est in sit in non."),
                  OnBoardingWidget(
                      image: Images.ob3,
                      titleAp: "Lorem Ipsum",
                      title: "Lorem ipsum dolor sit amet ",
                      subTitle: " consectetur. Est in sit in non."),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32, left: 32, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      GenericPreferences.setBool('onboarding', true);
                      Get.offNamed(LoginScreen.route);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PageViewIndicateor(
                        isCurrentPage: _currentPage == 0,
                        marginEnd: 15,
                      ),
                      PageViewIndicateor(
                        isCurrentPage: _currentPage == 1,
                        marginEnd: 15,
                      ),
                      PageViewIndicateor(isCurrentPage: _currentPage == 2),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      if (_currentPage == 2) {
                        GenericPreferences.setBool('onboarding', true);
                        Get.offNamed(LoginScreen.route);
                        return;
                      }
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInBack,
                      );
                    },
                    child: Text(
                      _currentPage == 2 ? "Get Start" : "NEXT",
                      style: const TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
