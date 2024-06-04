import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../../../helper_functions.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key, required this.image, required this.title, required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the entire Column
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Image(
              width: ReGainHelperFunctions.screenWidth() * 0.8,
              height: ReGainHelperFunctions.screenHeight() * 0.5,
              image: AssetImage(image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: ReGainSizes.spaceBtwItems),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

}