import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/features/screens/forgotPassword/reset_password.dart';
import 'package:regain_mobile/provider/forgot_password_provider.dart';
import 'package:regain_mobile/themes/app_bar.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../../../themes/elements/input fields/regain_textbox.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, ''),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(ReGainSizes.defaultSpace),
        child: Consumer<ForgotPasswordProvider>(
          builder: (context, forgotPasswordProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ReGainTexts.forgotPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: ReGainSizes.spaceBtwItems),
                Text(ReGainTexts.forgotPasswordSubtitle,
                    style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: ReGainSizes.spaceBtwItems),

                // Email input field
                RegainTextbox(
                  controller: emailController,
                  labelText: ReGainTexts.email,
                  prefixIcon: const Icon(CupertinoIcons.envelope),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: ReGainSizes.spaceBtwItems),

                // Error message box (if any error occurs)
                if (forgotPasswordProvider.errorMessage.isNotEmpty)
                  AnimatedOpacity(
                    opacity: forgotPasswordProvider.errorMessage.isNotEmpty ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: ReGainSizes.spaceBtwItems),
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
                              forgotPasswordProvider.errorMessage,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                // Submit button 
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        String email = emailController.text.trim();

                        // email validation
                        if (email.isEmpty || !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email)) {
                          forgotPasswordProvider.errorMessage = 'Please enter a valid email';
                        } else {
                         
                          forgotPasswordProvider.requestPasswordReset(email).then((_) {
                            if (forgotPasswordProvider.errorMessage.isEmpty) {
  
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResetPasswordScreen(
                                  successMessage: "An OTP has been sent to your email.",
                                ),
                              ),
                            );
                            }
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
                      child: forgotPasswordProvider.isLoading
                          ? const CircularProgressIndicator(color: white)
                          : Text(
                              "Submit",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: white),
                            ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
