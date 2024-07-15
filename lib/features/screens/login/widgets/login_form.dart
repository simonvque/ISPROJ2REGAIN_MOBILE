import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/user_model.dart';
import 'package:regain_mobile/nav.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/routes/route_manager.dart';

import 'package:regain_mobile/themes/elements/button_styles.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../../../themes/elements/input fields/password_textbox.dart';
import '../../../../themes/elements/input fields/regain_textbox.dart';
import '../../forgotPassword/forgot_password.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordVisible = false;
  String? _errorMsg;

  final _loginKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Username

          RegainTextbox(
            controller: usernameController,
            errorText: _errorMsg,
            labelText: ReGainTexts.username,
            isUnderlineBorder: true,
          ),
          // TextFormField(
          //   decoration: const InputDecoration(labelText: ReGainTexts.logIn),
          // ),
          const SizedBox(height: ReGainSizes.spaceBtwInputFields),

          // Password
          PasswordTextFormField(
            controller: passwordController,
            errorText: _errorMsg,
            labelText: ReGainTexts.password,
            isUnderlineBorder: true,
          ),
          // TextFormField(
          //   decoration: const InputDecoration(labelText: ReGainTexts.password, suffixIcon: Icon(Iconsax.eye_slash)),
          // ),
          const SizedBox(height: ReGainSizes.spaceBtwInputFields / 2),

          // Forgot Password
          Row(
            children: [
              const Spacer(), // Pushes the "Forgot Password" text to the right
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgetPasswordScreen()),
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
              // --- Add validation ---
              _login();

              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const NavigationMenu()));
            },
            type: ButtonType.filled,
            size: ButtonSize.large,
            txtSize: BtnTxtSize.large,
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
                      RouteManager.routeRegistration,
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

  void _login() {
    // Provider.of<AppDataProvider>(context, listen: false).login(user);
    if (_loginKey.currentState!.validate()) {
      final loginUser = UserModel(
          username: usernameController.text, password: passwordController.text);
      Provider.of<AppDataProvider>(context, listen: false)
          .login(loginUser)
          .then((response) {
        if (response.statusCode == 200) {
          resetFields();
          Navigator.pushNamed(context, RouteManager.routeNavMenu);
          ReGainHelperFunctions.showSnackBar(context, response.message);
        } else if (response.statusCode == 400) {
          setState(() {
            _errorMsg = response.message;
          });
        }
      });
    }
  }

  void resetFields() {
    _errorMsg = "";
    usernameController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
