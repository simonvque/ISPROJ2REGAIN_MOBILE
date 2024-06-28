import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:regain_mobile/nav.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../profile/seller_profile_page.dart';
import '../../../../themes/elements/input fields/password_textbox.dart';
import '../../../../themes/elements/input fields/regain_textbox.dart';
import '../../forgotPassword/forgot_password.dart';
import '../../homepage/homepage.dart';
import '../../registration/registration.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Username
          RegainTextbox(
            labelText: ReGainTexts.logIn,
            isUnderlineBorder: true,
          ),
          const SizedBox(height: ReGainSizes.spaceBtwInputFields),

          // Password
          PasswordTextFormField(
            labelText: ReGainTexts.password,
          ),
          const SizedBox(height: ReGainSizes.spaceBtwInputFields / 2),

          // Forgot Password
          Row(
            children: [
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgetPasswordScreen()),
                  );
                },
                child: Text(
                  ReGainTexts.forgotPassword,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: ReGainSizes.spaceBtwSections),

          // Login button
          RegainButtons(
            text: ReGainTexts.logIn,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomepageScreen()),
              );
            },
            type: ButtonType.filled,
            size: ButtonSize.large,
          ),

          // Sign up
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have ReGain account?",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()),
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
