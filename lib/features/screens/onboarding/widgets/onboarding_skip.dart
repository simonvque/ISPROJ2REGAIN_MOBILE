import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/device_utility.dart';
import '../../../../constants/sizes.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: ReGainSizes.defaultSpace,
      child: TextButton(
        onPressed: (){},
        style: TextButton.styleFrom(
          foregroundColor: green,
        ),
        child: Text(
          'Skip',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


}