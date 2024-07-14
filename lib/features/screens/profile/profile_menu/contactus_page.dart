import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';
import '../../../../themes/elements/input fields/regain_textbox.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Contact us'),
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
                      ReGainTexts.cuHeading,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: ReGainSizes.spaceBtwItems),
                    Text(
                      ReGainTexts.cuMessage,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: ReGainSizes.spaceBtwItems),
                    RegainTextbox(
                      labelText: ReGainTexts.cuEmail,
                      isUnderlineBorder: true,
                    ),
                    const SizedBox(height: ReGainSizes.spaceBtwInputFields),
                    RegainTextbox(
                      labelText: ReGainTexts.cuSubject,
                      isUnderlineBorder: true,
                    ),

                    const SizedBox(height: ReGainSizes.spaceBtwInputFields),
                    const SizedBox(height: ReGainSizes.spaceBtwInputFields),

                    TextField(
                    maxLines: 6,
                    textInputAction: TextInputAction.done, 
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: green),
                              ),
                      hintText: 'Please elaborate your concern here.',
                      hintStyle: Theme.of(context).textTheme.labelMedium
                    ),
                  ),
                    const SizedBox(height: ReGainSizes.spaceBtwInputFields),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: RegainButtons(
                        text: 'Submit',
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