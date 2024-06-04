import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/device_utility.dart';
import '../../../../helper_functions.dart';

class OnboardingNext extends StatelessWidget {
  const OnboardingNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: ReGainHelperFunctions.screenWidth() / 2,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              foregroundColor: white,
              backgroundColor: green,
            ),
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }

}
