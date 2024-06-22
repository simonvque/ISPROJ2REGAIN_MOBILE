import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/combal_page.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/contactus_page.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/penalty_page.dart';
import 'package:regain_mobile/features/screens/profile/seller_profile_page.dart';
import 'package:regain_mobile/features/screens/profile/settings/settings_page.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/transactions_page.dart';
import 'package:regain_mobile/features/screens/profile/util/transactions_data.dart';

import '../../../themes/elements/button_styles.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ReGainTexts.lblProfileMenu,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: gray),
        ),
        RegainButtons(
          text: 'Manage listings',
          onPressed: () {
            //add code
          },
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PenaltyPage(),
              ),
            );
          },
          type: ButtonType.transparentOutlined,
          size: ButtonSize.large,
          leftIcon: CupertinoIcons.exclamationmark_circle,
          rightIcon: CupertinoIcons.chevron_forward,
        ),
        RegainButtons(
          text: 'Settings',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingsPage()));
          },
          type: ButtonType.transparentOutlined,
          size: ButtonSize.large,
          leftIcon: CupertinoIcons.settings,
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
        const SizedBox(
          height: ReGainSizes.largeSpace,
        ),
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
