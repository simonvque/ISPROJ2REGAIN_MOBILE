import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/features/screens/login/login.dart';
import 'package:regain_mobile/provider/forgot_password_provider.dart';
import 'package:regain_mobile/themes/app_bar.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String? successMessage;

  const ResetPasswordScreen({super.key, this.successMessage});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController otpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? errorMessage;
  String? successMessage;
  bool isOtpVerified = false;
  bool showPassword = false;
  bool showConfirmPassword = false;
  bool isPasswordReset = false;

  @override
  void initState() {
    super.initState();
    successMessage = widget.successMessage;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: buildAppBar(context, ''),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(ReGainSizes.defaultSpace),
            child: Column(
              children: [
                Text('Verify & Reset your Password',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: ReGainSizes.spaceBtwItems),

                // Success Message
                if (successMessage != null)
                  AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: ReGainSizes.spaceBtwItems),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle,
                              color: Colors.green, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              successMessage ?? '',
                              style: const TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                // OTP input field
                if (!isOtpVerified)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: ReGainSizes.spaceBtwItems),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: TextEditingController(
                              text: otpController.text.length > index
                                  ? otpController.text[index]
                                  : '',
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            onChanged: (value) {
                              if (value.length == 1 && index < 3) {
                                FocusScope.of(context).nextFocus();
                              }
                              if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus();
                              }
                              String currentOtp = otpController.text;
                              if (value.isNotEmpty) {
                                if (index < currentOtp.length) {
                                  otpController.text =
                                      currentOtp.substring(0, index) + value;
                                } else {
                                  otpController.text += value;
                                }
                              }
                            },
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: green),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                // Error message (OTP or password)
                if (errorMessage != null && errorMessage!.isNotEmpty)
                  AnimatedOpacity(
                    opacity: errorMessage!.isNotEmpty ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: ReGainSizes.spaceBtwItems),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.error, color: Colors.red, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              errorMessage!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                if (!isOtpVerified)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (otpController.text.length != 4) {
                            setState(() {
                              errorMessage =
                                  'Please enter a valid 4-digit OTP.';
                            });
                          } else {
                            setState(() {
                              errorMessage = null;
                            });

                            await provider.verifyOtp(otpController.text);
                            if (provider.successMessage.isNotEmpty) {
                              setState(() {
                                isOtpVerified = true;
                                successMessage =
                                    "OTP verified. You can now reset your password.";
                              });
                            } else {
                              setState(() {
                                errorMessage = 'Invalid OTP. Please try again.';
                              });
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: white,
                          backgroundColor: green,
                        ),
                        child: provider.isLoading
                            ? CircularProgressIndicator(color: white)
                            : const Text("Verify OTP"),
                      ),
                    ),
                  ),

                // Password field
                if (isOtpVerified && !isPasswordReset)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: ReGainSizes.spaceBtwItems),
                        child: TextField(
                          controller: passwordController,
                          obscureText: !showPassword,
                          decoration: InputDecoration(
                            labelText: "New Password",
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: green),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: ReGainSizes.spaceBtwItems),
                        child: TextField(
                          controller: confirmPasswordController,
                          obscureText: !showConfirmPassword,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                showConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  showConfirmPassword = !showConfirmPassword;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: green),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                if (isOtpVerified && !isPasswordReset)
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          String password = passwordController.text.trim();
                          String confirmPassword =
                              confirmPasswordController.text.trim();

                          // 1. Check if all fields are filled
                          if (password.isEmpty || confirmPassword.isEmpty) {
                            setState(() {
                              errorMessage = 'Please fill out all fields.';
                            });
                            return;
                          }

                          // 2. Validate the password
                          String? validationError = validatePassword(password);
                          if (validationError != null) {
                            setState(() {
                              errorMessage = validationError;
                            });
                            return;
                          }

                          // 3. Check if passwords match
                          if (password != confirmPassword) {
                            setState(() {
                              errorMessage = 'Passwords do not match.';
                            });
                            return;
                          }

                          // If all validations pass, proceed with password reset
                          setState(() {
                            errorMessage = null;
                          });

                          await provider.resetPassword(
                              otpController.text, password);
                          if (provider.successMessage.isNotEmpty) {
                            setState(() {
                              successMessage = provider.successMessage;
                              isPasswordReset = true;
                            });
                          } else {
                            setState(() {
                              errorMessage = 'Failed to reset password.';
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: white,
                          backgroundColor: green,
                        ),
                        child: provider.isLoading
                            ? CircularProgressIndicator(color: white)
                            : const Text("Reset Password"),
                      ),
                    ),
                  ),

                if (isPasswordReset)
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: white,
                          backgroundColor: green,
                        ),
                        child: const Text("Back to Login"),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

String? validatePassword(String password) {
  List<String> conditions = [];

  if (password.length < 12) {
    conditions.add('12+ characters');
  }
  if (!password.contains(RegExp(r'[A-Z]'))) {
    conditions.add('an uppercase letter');
  }
  if (!password.contains(RegExp(r'[a-z]'))) {
    conditions.add('a lowercase letter');
  }
  if (!password.contains(RegExp(r'\d'))) {
    conditions.add('a number');
  }
  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    conditions.add('a special character');
  }

  if (conditions.isEmpty) {
    return null; // No errors
  }

  // Join the conditions with commas and "and" for the last condition
  String conditionSentence = conditions.length == 1
      ? conditions.first
      : '${conditions.sublist(0, conditions.length - 1).join(", ")}, and ${conditions.last}';

  return 'Password must have: $conditionSentence.';
}
