import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/device_utility.dart';
import '../../../../constants/sizes.dart';
import '../../../controllers/onboarding_controller.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ReGainDeviceUtils.getAppBarHeight(),
      right: ReGainSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        style: TextButton.styleFrom(
          foregroundColor: green,
        ),
        child: Text(
          'Skip',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: green),
        ),
      ),
    );
  }


}
