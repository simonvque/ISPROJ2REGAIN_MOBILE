import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/registration/registration_otp.dart';

import '../../../common/styles/spacing_styles.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../../../themes/elements/button_styles.dart';
import '../../../themes/elements/input fields/password_textbox.dart';
import '../../../themes/elements/input fields/regain_textbox.dart';
import '../login/login.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isWasteSector = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ReGainSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(ReGainImages.appLogo),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      ReGainTexts.signUpTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: ReGainSizes.sm),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      ReGainTexts.signUpSubtitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Username
                      const RegainTextbox(
                          labelText: ReGainTexts.username,
                          isUnderlineBorder: true),
                      const SizedBox(
                          height: ReGainSizes.spaceBtwInputFields / 2),

                      // Password
                      const PasswordTextFormField(
                          labelText: ReGainTexts.password),
                      const SizedBox(
                          height: ReGainSizes.spaceBtwInputFields / 2),

                      // Confirm Password
                      const PasswordTextFormField(
                          labelText: ReGainTexts.confirmPassword),
                      const SizedBox(
                          height: ReGainSizes.spaceBtwInputFields / 2),

                      // Contact Number
                      const RegainTextbox(
                          labelText: ReGainTexts.contactNumber,
                          keyboardType: TextInputType.phone,
                          isUnderlineBorder: true),
                      const SizedBox(height: ReGainSizes.spaceBtwInputFields),

                      // Are you part of the waste sector?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isWasteSector,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isWasteSector = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Are you part of the waste sector?',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.info_outline),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Info'),
                                    content: Text(
                                        'Information about being part of the waste sector.'),
                                    actions: [
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),

                      // SignUp button
                      const SizedBox(height: ReGainSizes.spaceBtwSections),

                      RegainButtons(
                        text: ReGainTexts.signUp,
                        onPressed: () {
                          // --- Add validation ---

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationOtp()));
                        },
                        type: ButtonType.filled,
                        size: ButtonSize.large,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                              child: Text(
                                "Log In",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
