import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:regain_mobile/features/screens/login/widgets/login_form.dart';
import 'package:regain_mobile/features/screens/login/widgets/login_logo.dart';

import '../../../common/spacing_styles.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';

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



