import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/registration/registration_verified.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../../../themes/elements/button_styles.dart';

class RegistrationOtp extends StatelessWidget{
  const RegistrationOtp({super.key});

  final String mobileNumber = "1234567890";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Verification Code',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              Text(
                'Please send your OTP code sent to your mobile number $mobileNumber',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOTPField(context),
                  _buildOTPField(context),
                  _buildOTPField(context),
                  _buildOTPField(context),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t receive it?",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        // ------- SEND OTP ------
                      },
                      child: Text(
                        "Resend OTP",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: ReGainSizes.spaceBtwSections),

              RegainButtons(
                text: ReGainTexts.signUp,
                onPressed: (){
                  // --- Add validation ---
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const RegistrationVerified()));
                },
                type: ButtonType.filled,
                size: ButtonSize.medium,
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOTPField(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextField(
        onChanged: (value){
          if(value.length == 1){
            FocusScope.of(context).nextFocus();
          }
        },

        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color:green),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: green, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}