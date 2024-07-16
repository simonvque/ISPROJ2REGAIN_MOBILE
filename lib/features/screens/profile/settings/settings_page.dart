import 'package:flutter/cupertino.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/profile/settings/about/privacypol_page.dart';
import 'package:regain_mobile/features/screens/profile/settings/about/refundpol_page.dart';
import 'package:regain_mobile/features/screens/profile/settings/about/termofuse_page.dart';
import 'package:regain_mobile/features/screens/profile/settings/change_pw_page.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

import '../../../../constants/colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Settings'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            ReGainTexts.lblSettingsAcc,
            style:
                Theme.of(context).textTheme.labelMedium?.copyWith(color: gray),
          ),
          RegainButtons(
            text: 'Change password',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangePWPage()));
            },
            type: ButtonType.transparentOutlined,
            size: ButtonSize.large,
            txtSize: BtnTxtSize.large,
            leftIcon: CupertinoIcons.lock_shield,
            rightIcon: CupertinoIcons.chevron_forward,
          ),
          Text(
            ReGainTexts.lblSettingsAbt,
            style:
                Theme.of(context).textTheme.labelMedium?.copyWith(color: gray),
          ),
          RegainButtons(
            text: 'FAQs',
            onPressed: () {
              //FAQs page
            },
            type: ButtonType.transparentOutlined,
            size: ButtonSize.large,
            txtSize: BtnTxtSize.large,
            leftIcon: CupertinoIcons.question_circle,
            rightIcon: CupertinoIcons.chevron_forward,
          ),
          RegainButtons(
            text: 'Legal & policies',
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const LegalPolPage()));
            },
            type: ButtonType.transparentOutlined,
            size: ButtonSize.large,
            txtSize: BtnTxtSize.large,
            leftIcon: CupertinoIcons.doc_plaintext,
            rightIcon: CupertinoIcons.chevron_forward,
          ),
        ]),
      ),
    );
  }
}

class LegalPolPage extends StatelessWidget {
  const LegalPolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, 'Legal & policies'),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RegainButtons(
                text: 'Term of use',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TermOfUsePage()));
                },
                type: ButtonType.transparentOutlined,
                size: ButtonSize.large,
                txtSize: BtnTxtSize.large,
                rightIcon: CupertinoIcons.chevron_forward,
              ),
              RegainButtons(
                text: 'Privacy policy',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyPage()));
                },
                type: ButtonType.transparentOutlined,
                size: ButtonSize.large,
                txtSize: BtnTxtSize.large,
                rightIcon: CupertinoIcons.chevron_forward,
              ),
              RegainButtons(
                text: 'Return & refund policy',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RefundPolicyPage()));
                },
                type: ButtonType.transparentOutlined,
                size: ButtonSize.large,
                txtSize: BtnTxtSize.large,
                rightIcon: CupertinoIcons.chevron_forward,
              ),
            ])));
  }
}
