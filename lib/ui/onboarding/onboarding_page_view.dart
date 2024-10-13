// Class cha: Quan ly cac page con. Quan ly qua lai giua cac page con
import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/enum/onboarding_page_position.dart';
import 'onboarding_child_page.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics:
            const NeverScrollableScrollPhysics(), // User cannot scroll on screen
        children: [
          // Truyen vao ca Widget con ma page view muon hien thi.
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page1,
            nextOnPressed: () {
              _pageController.jumpToPage(1);
            },
            backOnPressed: () {},
            skipOnPressed: () {
              print("Go to Welcome Screen");
            },
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page2,
            nextOnPressed: () {
              _pageController.jumpToPage(2);
            },
            backOnPressed: () {
              _pageController.jumpToPage(0);
            },
            skipOnPressed: () {
              print("Go to Welcome Screen");
            },
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page3,
            nextOnPressed: () {
              print("Go to Welcome Screen");
            },
            backOnPressed: () {
              _pageController.jumpToPage(1);
            },
            skipOnPressed: () {
              print("Go to Welcome Screen");
            },
          ),
        ],
      ),
    );
  }
}
