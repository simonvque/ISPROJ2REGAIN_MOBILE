import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/features/screens/registration/registration_id.dart';
import 'package:regain_mobile/features/validations/form_validators.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/routes/route_manager.dart';

import '../../../common/styles/spacing_styles.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../../../model/user_model.dart';
import '../../../themes/elements/button_styles.dart';
import '../../../themes/elements/input fields/password_textbox.dart';
import '../../../themes/elements/input fields/regain_textbox.dart';

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
  String? errorText;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final matchingPasswordController = TextEditingController();
  final emailController = TextEditingController();

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
                  SizedBox(
                    width: 148,
                    height: 148,
                    child: Image.asset(
                      ReGainImages.appLogo,
                      fit: BoxFit.contain,
                    ),
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
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Username
                      RegainTextbox(
                        controller: usernameController,
                        validator: (value) => Validators.usernameValidation(
                            value,
                            fieldName: 'username'),
                        errorText: errorText,
                        labelText: ReGainTexts.username,
                        isUnderlineBorder: true,
                      ),

                      const SizedBox(
                          height: ReGainSizes.spaceBtwInputFields / 2),

                      // Password
                      PasswordTextFormField(
                          controller: passwordController,
                          validator: Validators.passwordValidation,
                          labelText: ReGainTexts.password),
                      const SizedBox(
                          height: ReGainSizes.spaceBtwInputFields / 2),

                      // Confirm Password >> NOT YET IMPLEMENTED
                      PasswordTextFormField(
                          controller: matchingPasswordController,
                          validator: (value) =>
                              Validators.confirmPasswordValidation(
                                  value, passwordController.text),
                          labelText: ReGainTexts.confirmPassword),
                      const SizedBox(
                          height: ReGainSizes.spaceBtwInputFields / 2),

                      // Email
                      RegainTextbox(
                        controller: emailController,
                        validator: Validators.emailValidation,
                        errorText: errorText,
                        labelText: ReGainTexts.email,
                        keyboardType: TextInputType.text,
                        isUnderlineBorder: true,
                      ),
                      const SizedBox(height: ReGainSizes.spaceBtwInputFields),

                      // Are you part of the waste sector?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.info_outline),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Info'),
                                    content: const Text(
                                        'Agents of the formal and informal waste management system, including but not limited to: Waste pickers, junkshops, recycling companies, etc.'),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
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
                        text: ReGainTexts.next,
                        onPressed:
                            // () {
                            //   Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const RegistrationIDPage(),
                            //     ),
                            //   );
                            // },
                            addUser,
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
                                  RouteManager.routeLogin,
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

  void addUser() {
    String userRole;
    if (isWasteSector) {
      userRole = Roles.uJS;
    } else {
      userRole = Roles.uHH;
    }
    if (_formKey.currentState!.validate()) {
      final user = UserModel(
        role: userRole,
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Provider.of<AppDataProvider>(context, listen: false)
          .addUser(user)
          .then((response) {
        if (response.statusCode == 200) {
          resetFields();
          //Navigator.pushNamed(context, RouteManager.routeLogin);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RegistrationIDPage(
                user: user,
              ),
            ),
          );
          ReGainHelperFunctions.showSnackBar(context, response.message);
        } else if (response.statusCode == 400) {
          setState(() {
            errorText = response.message;
          });
        }
      });
    }
  }

  bool validateEmail(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  void resetFields() {
    errorText = "";
    usernameController.clear();
    passwordController.clear();
    matchingPasswordController.clear();
    emailController.clear();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    matchingPasswordController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
