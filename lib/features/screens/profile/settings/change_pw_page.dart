import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

import '../../../../themes/elements/input fields/password_textbox.dart';

class ChangePWPage extends StatelessWidget {
  const ChangePWPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Change password'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verify your current password:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    PasswordTextFormField(
                      labelText: ReGainTexts.currentPW,
                      isUnderlineBorder: true,
                    ),
                    const SizedBox(height: ReGainSizes.largeSpace),
                    Text(
                      'Update your new password:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    PasswordTextFormField(
                      labelText: ReGainTexts.newPW,
                      isUnderlineBorder: true,
                    ),
                    const SizedBox(height: ReGainSizes.spaceBtwInputFields),
                    PasswordTextFormField(
                      labelText: ReGainTexts.confirmPassword,
                      isUnderlineBorder: true,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: RegainButtons(
                        text: 'Save',
                        onPressed: () {},
                        type: ButtonType.filled,
                        size: ButtonSize.large,
                        txtSize: BtnTxtSize.large,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}