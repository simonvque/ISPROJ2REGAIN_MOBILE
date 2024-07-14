import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/device_utility.dart';
import '../../../controllers/onboarding_controller.dart';

class OnboardingNavigation extends StatelessWidget {
  const OnboardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: ReGainDeviceUtils.getBottomNavigationBarHeight() + 80,
      left: 0,
      right: 0,
      child: Center(
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 4,
          effect: const ExpandingDotsEffect(activeDotColor: green, dotHeight: 6, dotWidth: 6,
          ),
        ),
      ),
    );
  }
}