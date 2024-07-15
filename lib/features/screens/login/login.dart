import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/login/widgets/login_form.dart';
import 'package:regain_mobile/features/screens/login/widgets/login_logo.dart';

import '../../../common/styles/spacing_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ReGainSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ReGainLogo(),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
