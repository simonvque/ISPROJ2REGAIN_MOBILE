import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../../../themes/elements/input fields/password_textbox.dart';
import '../../../../themes/elements/input fields/regain_textbox.dart';
import '../../forgotPassword/forgot_password.dart';
import '../../homepage/homepage.dart';
import '../../registration/registration.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordVisible = false; // Track whether password is visible or not

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Username
          const RegainTextbox(labelText: ReGainTexts.logIn, isUnderlineBorder: true),
          // TextFormField(
          //   decoration: const InputDecoration(labelText: ReGainTexts.logIn),
          // ),
          const SizedBox(height: ReGainSizes.spaceBtwInputFields),

          // Password
          const PasswordTextFormField(labelText: ReGainTexts.password),
          // TextFormField(
          //   decoration: const InputDecoration(labelText: ReGainTexts.password, suffixIcon: Icon(Iconsax.eye_slash)),
          // ),
          const SizedBox(height: ReGainSizes.spaceBtwInputFields / 2),

          // Forgot Password
          Row(
            children: [
              Spacer(), // Pushes the "Forgot Password" text to the right
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
                  );
                },
                child: Text(
                  ReGainTexts.forgotPassword,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),

          // Login button
          Padding(
            padding: EdgeInsets.only(top: 32.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  // ------------------------ ADD VALIDATION ------------------------
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomepageScreen()),
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
                  ReGainTexts.logIn,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: white),
                ),
              ),
            ),
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
                      MaterialPageRoute(builder: (context) => RegistrationScreen()),
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
