import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../helper_functions.dart';
import '../login/login.dart';

class ResetPasswordScreen extends StatelessWidget{
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(ReGainSizes.defaultSpace),
        child: Column(
          children: [
            Image(image: const AssetImage(ReGainImages.shield), width: ReGainHelperFunctions.screenWidth() * 0.6),
            const SizedBox(height: ReGainSizes.spaceBtwSections),

            Text("Password Reset Link Sent", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            const SizedBox(height: ReGainSizes.spaceBtwSections),
            Text("Your account security is our priority! We have sent you a secure link to safely change your password", style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
            const SizedBox(height: ReGainSizes.spaceBtwSections),

            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
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
                    "Submit",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}