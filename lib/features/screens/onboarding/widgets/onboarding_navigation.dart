import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/device_utility.dart';

class OnboardingNavigation extends StatelessWidget {
  const OnboardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 80,
      left: 0,
      right: 0, // Stretch the Positioned widget horizontally
      child: Center(
        child: SmoothPageIndicator( controller: PageController(),  count: 4,
          effect: ExpandingDotsEffect(activeDotColor: green, dotHeight: 6, dotWidth: 6,
          ),
        ),
      ),
    );
  }
}
