import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/profile/combal_page.dart';
import 'package:regain_mobile/features/screens/profile/contactus_page.dart';
import 'package:regain_mobile/features/screens/profile/seller_profile_page.dart';
// import 'package:regain_mobile/features/screens/profile/settings_page.dart';
import 'package:regain_mobile/features/screens/profile/transactions_page.dart';
import 'package:regain_mobile/features/screens/profile/util/transactions_data.dart';

import '../../../themes/elements/button_styles.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(ReGainTexts.labelName,
            style:
                Theme.of(context).textTheme.labelLarge?.copyWith(color: gray)),
        RegainButtons(
          text: 'Manage Listings',
          onPressed: () {},
          type: ButtonType.transparentOutlined,
          size: ButtonSize.large,
          leftIcon: CupertinoIcons.collections,
          rightIcon: CupertinoIcons.chevron_forward,
        ),
        RegainButtons(
          text: 'Transaction History',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TransactionsPage(
                  transactions: transactions,
                ),
              ),
            );
          },
          type: ButtonType.transparentOutlined,
          size: ButtonSize.large,
          leftIcon: CupertinoIcons.doc_on_clipboard,
          rightIcon: CupertinoIcons.chevron_forward,
        ),
        RegainButtons(
          text: 'Commission balance',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CommissionPage(),
              ),
            );
          },
          type: ButtonType.transparentOutlined,
          size: ButtonSize.large,
          leftIcon: CupertinoIcons.creditcard,
          rightIcon: CupertinoIcons.chevron_forward,
        ),
        RegainButtons(
          text: 'Penalty points',
          onPressed: () {
            //penalty points page
          },
          type: ButtonType.transparentOutlined,
          size: ButtonSize.large,
          leftIcon: CupertinoIcons.exclamationmark_circle,
          rightIcon: CupertinoIcons.chevron_forward,
        ),
        RegainButtons(
          text: 'Settings',
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const SettingsPage()));
          },
          type: ButtonType.transparentOutlined,
          size: ButtonSize.large,
          leftIcon: CupertinoIcons.settings,
          rightIcon: CupertinoIcons.chevron_forward,
        ),
        RegainButtons(
          text: 'FAQs',
          onPressed: () {
            //FAQs page
          },
          type: ButtonType.transparentOutlined,
          size: ButtonSize.large,
          leftIcon: CupertinoIcons.question_circle,
          rightIcon: CupertinoIcons.chevron_forward,
        ),
        RegainButtons(
          text: 'Contact us',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ContactUsPage()));
          },
          type: ButtonType.transparentOutlined,
          size: ButtonSize.large,
          leftIcon: CupertinoIcons.chat_bubble_2,
          rightIcon: CupertinoIcons.chevron_forward,
        ),
        const SizedBox(height: ReGainSizes.spaceBtwSections),
        RegainButtons(
          text: 'Logout',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SellerProfilePage()));
          },
          type: ButtonType.filled,
          size: ButtonSize.large,
        ),
      ],
    );
  }
}

class StyleBtnTxt extends StatelessWidget {
  const StyleBtnTxt(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ));
  }
}

class StyleLabelTxt extends StatelessWidget {
  const StyleLabelTxt(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
    );
  }
}
