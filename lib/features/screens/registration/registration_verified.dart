import 'package:flutter/material.dart';

import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../themes/elements/button_styles.dart';
import '../login/login.dart';

class RegistrationVerified extends StatelessWidget {
  const RegistrationVerified({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ReGainImages.shield,
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              Text(
                'Your account has been verified successfully.',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: ReGainSizes.spaceBtwSections),

              RegainButtons(
                text: 'Done',
                onPressed: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                type: ButtonType.filled,
                size: ButtonSize.large,
              ),

            ],
          ),
        ),
      ),
    );
  }
}