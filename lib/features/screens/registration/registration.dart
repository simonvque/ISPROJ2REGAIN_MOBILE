import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:regain_mobile/features/screens/registration/registration_otp.dart';
import '../../../common/styles/spacing_styles.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
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
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: ReGainTexts.username,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: green),
                          ),
                        ),
                      ),
                      const SizedBox(height: ReGainSizes.spaceBtwInputFields),

                      // Password
                      TextFormField(
                        obscureText: !isPasswordVisible, // Toggle obscureText based on isPasswordVisible
                        decoration: InputDecoration(
                          labelText: ReGainTexts.password,
                          suffixIcon: IconButton(
                            icon: isPasswordVisible ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: green),
                          ),
                        ),
                      ),
                      const SizedBox(height: ReGainSizes.spaceBtwInputFields / 2),

                      // Confirm Password
                      TextFormField(
                        obscureText: !isConfirmPasswordVisible, // Toggle obscureText based on isConfirmPasswordVisible
                        decoration: InputDecoration(
                          labelText: ReGainTexts.confirmPassword,
                          suffixIcon: IconButton(
                            icon: isConfirmPasswordVisible ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isConfirmPasswordVisible = !isConfirmPasswordVisible;
                              });
                            },
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: green),
                          ),
                        ),
                      ),
                      const SizedBox(height: ReGainSizes.spaceBtwInputFields / 2),

                      // Contact Number
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: ReGainTexts.contactNumber,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: green),
                          ),
                        ),
                      ),
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
                                    content: Text('Information about being part of the waste sector.'),
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
                      const SizedBox(height: ReGainSizes.spaceBtwInputFields),

                      // SignUp button
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // --------------------- ADD VALIDATION HERE ---------------------

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => RegistrationOtp()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              foregroundColor: white,
                              backgroundColor: green,
                            ),
                            child: const Text(
                              ReGainTexts.signUp,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(color: black),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginScreen()),
                                );
                              },
                              child: const Text(
                                "Log In",
                                style: TextStyle(
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                ),
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
