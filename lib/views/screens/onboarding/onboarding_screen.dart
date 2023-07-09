import 'package:flutter/material.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/images.dart';

import '../../widget/on_bording_widget.dart';
import '../../widget/page_view_indicatore.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
                physics: BouncingScrollPhysics(),
                onPageChanged: (int currentPage) {
                  setState(() {
                    print(currentPage);
                    print(_pageController);
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
              padding: EdgeInsets.only(right: 32, left: 32, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        2,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInBack,
                      );
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
                      setState(() {
                        if (_currentPage > 1) {}
                      });
                    },
                    child: Text(
                      _currentPage > 1 ? "Get Start" : "NEXT",
                      style: TextStyle(color: Colors.blue),
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
