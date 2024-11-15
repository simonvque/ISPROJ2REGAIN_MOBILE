import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/login/login.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class RegistrationCompletePage extends StatelessWidget {
  const RegistrationCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.hourglass_bottom,
                  size: 80,
                  color: green, 
                ),
              ),
              
              const SizedBox(
              height: ReGainSizes.defaultSpace,
            ),

              // Title
              Text(
                'Account Registration Complete!',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),

              // Subtitle
              Text(
                ReGainTexts.completeRegSub,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 36),

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