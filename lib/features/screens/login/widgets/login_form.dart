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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  bool isLoading = false;

  Future<void> _login() async {
    setState(() {
      isLoading = true;
    });

    final loginSuccessful = await _attemptLogin(
      _usernameController.text,
      _passwordController.text,
    );

    setState(() {
      isLoading = false;
    });

    if (loginSuccessful) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavigationMenu()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Login failed. Please check your credentials.')),
      );
    }
  }

  Future<bool> _attemptLogin(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(
            'http://10.0.2.2:3000/login'), // Use 10.0.2.2 for Android emulator
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final token = json.decode(response.body)['token'];
        await _secureStorage.write(key: 'token', value: token);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
  }

  void _onLoginPressed() {
    if (!isLoading && _validateInputs()) {
      _login();
    }
  }

  bool _validateInputs() {
    if (_usernameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username cannot be empty.')),
      );
      return false;
    }
    if (_passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password cannot be empty.')),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Username
          RegainTextbox(
            controller: _usernameController,
            labelText: ReGainTexts.logIn,
            isUnderlineBorder: true,
          ),
          const SizedBox(height: ReGainSizes.spaceBtwInputFields),

          // Password
          PasswordTextFormField(
            controller: _passwordController,
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
            text: isLoading ? ' ' : ReGainTexts.logIn,
            onPressed: _onLoginPressed,
            type: ButtonType.filled,
            size: ButtonSize.large,
          ),

          // Loading indicator
          if (isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(child: CircularProgressIndicator()),
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
                    Navigator.pushNamed(
                      context,
                      routeRegistration,
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
