import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
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
              const SizedBox(height: 40),

              Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                      // ------------------------ ADD VALIDATION ------------------------
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      foregroundColor: white,
                      backgroundColor: green,
                    ),
                    child: Text(
                      'Done',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}