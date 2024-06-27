import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/features/screens/registration/registration_otp.dart';
import 'package:regain_mobile/helper_functions.dart';

import '../../../common/styles/spacing_styles.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../../../entities/user_model.dart';
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
  // global key
  final _formKey = GlobalKey<FormState>();

  bool isWasteSector = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final matchingPasswordController = TextEditingController();
  final contactNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                        RegainTextbox(
                            controller: usernameController,
                            validator: (value) {
                              // insert validations here
                              if (value == null || value.isEmpty) {
                                return 'Please enter a username';
                              }
                            },
                            labelText: ReGainTexts.username,
                            isUnderlineBorder: true),
                        const SizedBox(
                            height: ReGainSizes.spaceBtwInputFields / 2),

                        // Password
                        PasswordTextFormField(
                            controller: passwordController,
                            validator: (value) {
                              // insert validations here
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                            },
                            labelText: ReGainTexts.password),
                        const SizedBox(
                            height: ReGainSizes.spaceBtwInputFields / 2),

                        // Confirm Password >> NOT YET IMPLEMENTED
                        PasswordTextFormField(
                            controller: matchingPasswordController,
                            validator: (value) {
                              if (value == null ||
                                  value != passwordController.text) {
                                return 'Please confirm your password';
                              }
                            },
                            labelText: ReGainTexts.confirmPassword),
                        const SizedBox(
                            height: ReGainSizes.spaceBtwInputFields / 2),

                        // Contact Number
                        RegainTextbox(
                            controller: contactNumberController,
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
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
                          onPressed: addUser,
                          // onPressed: () {
                          //   // --- Add validation ---

                          //   Navigator.pushReplacement(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) =>
                          //               const RegistrationOtp()));
                          // },
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
                                  Navigator.pushNamed(
                                    context,
                                    routeLogin,
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
      ),
    );
  }

  void addUser() {
    if (_formKey.currentState!.validate()) {
      final user = UserModel(
        username: usernameController.text,
        contactNumber: contactNumberController.text,
        password: passwordController.text,
      );
      Provider.of<AppDataProvider>(context, listen: false)
          .addUser(user)
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          resetFields();
          Navigator.pushNamed(context, routeLogin);
          ReGainHelperFunctions.showSnackBar(context, response.message);
        }
      });
    }
  }

  void resetFields() {
    usernameController.clear();
    passwordController.clear();
    matchingPasswordController.clear();
    contactNumberController.clear();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    matchingPasswordController.dispose();
    contactNumberController.dispose();
    super.dispose();
  }
}
