import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
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
          SizedBox(height: ReGainSizes.spaceBtwInputFields / 2),

          // Forgot Password
          Row(
            children: [
              Spacer(), // Pushes the "Forgot Password" text to the right
              TextButton(
                onPressed: () {},
                child: const Text(
                  ReGainTexts.forgotPassword,
                  style: TextStyle(color: black),
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
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomepageScreen()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  foregroundColor: white,
                  backgroundColor: green,
                ),
                child: const Text(
                  ReGainTexts.logIn,
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                const Text(
                  "Don’t have ReGain account?",
                  style: TextStyle(color: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrationScreen()),
                    );
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
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
