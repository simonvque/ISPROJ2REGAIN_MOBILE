import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';

class ReGainLogo extends StatelessWidget {
  const ReGainLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            height: 150,
            image: AssetImage(ReGainImages.appLogo),
          ),
        ],
      ),
    );
  }
}
