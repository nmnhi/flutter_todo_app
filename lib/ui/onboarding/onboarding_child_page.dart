import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/enum/onboarding_page_position.dart';

class OnboardingChildPage extends StatelessWidget {
  final OnboardingPagePosition onboardingPagePosition;
  final VoidCallback nextOnPressed;
  final VoidCallback backOnPressed;
  final VoidCallback skipOnPressed;

  const OnboardingChildPage(
      {super.key,
      required this.onboardingPagePosition,
      required this.nextOnPressed,
      required this.backOnPressed,
      required this.skipOnPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSkipButton(),
                _buildOnBoardingImage(),
                _buildOnBoardingPageControl(),
                _buildOnBoardingTitleAndContent(),
                _buildOnBoardingNextAndBackButton()
              ],
            ),
          ),
        ));
  }

  Widget _buildSkipButton() {
    return Container(
      margin: const EdgeInsets.only(top: 14, left: 24),
      alignment: AlignmentDirectional.centerStart,
      child: TextButton(
        onPressed: () {
          skipOnPressed();
        },
        child: Text(
          "SKIP",
          style: TextStyle(
              fontSize: 16,
              fontFamily: "Lato",
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(0.44)),
        ),
      ),
    );
  }

  Widget _buildOnBoardingImage() {
    return Image.asset(
      onboardingPagePosition.onboardingPageImage(),
      width: 271,
      height: 296,
      fit: BoxFit.contain,
    );
  }

  Widget _buildOnBoardingPageControl() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Position 1
          Container(
            height: 4,
            width: 26,
            decoration: BoxDecoration(
              color: onboardingPagePosition == OnboardingPagePosition.page1
                  ? Colors.white
                  : Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(56),
            ),
          ),
          // Position 2
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 4,
            width: 26,
            decoration: BoxDecoration(
              color: onboardingPagePosition == OnboardingPagePosition.page2
                  ? Colors.white
                  : Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(56),
            ),
          ),
          // Position 3
          Container(
            height: 4,
            width: 26,
            decoration: BoxDecoration(
              color: onboardingPagePosition == OnboardingPagePosition.page3
                  ? Colors.white
                  : Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(56),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOnBoardingTitleAndContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            onboardingPagePosition.onboardingPageTitle(),
            style: TextStyle(
                color: Colors.white.withOpacity(0.87),
                fontFamily: "Lato",
                fontSize: 32,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 42,
          ),
          Text(
            onboardingPagePosition.onboardingPageContent(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.87),
              fontFamily: "Lato",
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _buildOnBoardingNextAndBackButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24)
          .copyWith(top: 107, bottom: 24),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              backOnPressed();
            },
            child: Text(
              "BACK",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.44)),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              nextOnPressed();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8875FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4))),
            child: Text(
              onboardingPagePosition == OnboardingPagePosition.page3
                  ? "GET START"
                  : "NEXT",
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
