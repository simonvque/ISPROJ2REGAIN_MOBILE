import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/image_strings.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/login/login.dart';
import 'package:regain_mobile/features/screens/profile/manage_addresses.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/combal_page.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/contactus_page.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/listing_page.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/penalty_page.dart';
import 'package:regain_mobile/features/screens/profile/seller_profile_page.dart';
import 'package:regain_mobile/features/screens/profile/settings/settings_page.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/transactions_page.dart';
import 'package:regain_mobile/features/screens/profile/util/transactions_data.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/routes/route_manager.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListingPage(),
              ),
            );
            // () {
            //add code
            // List<Map<String, dynamic>> products = [
            //   {
            //     'imagePath': ReGainImages.onboardingImage3,
            //     'title': 'Copper nail',
            //     'location': 'Pasig City',
            //     'price': 'PHP 450',
            //     'sellerImagePath': null,
            //     'seller': '@heyitscee',
            //     'weight': '5 kg',
            //     'category': 'Metal',
            //     'isSellerDropOff': true,
            //     'isFavorite': false
            //   },
            //   {
            //     'imagePath': ReGainImages.onboardingImage3,
            //     'title': 'Copper nail',
            //     'location': 'Pasig City',
            //     'price': 'PHP 450',
            //     'sellerImagePath': null,
            //     'seller': '@heyitscee',
            //     'weight': '5 kg',
            //     'category': 'Metal',
            //     'isSellerDropOff': true,
            //     'isFavorite': true
            //   },
            //   {
            //     'imagePath': ReGainImages.onboardingImage3,
            //     'title': 'Copper nail',
            //     'location': 'Pasig City',
            //     'price': 'PHP 450',
            //     'sellerImagePath': null,
            //     'seller': '@heyitscee',
            //     'weight': '5 kg',
            //     'category': 'Metal',
            //     'isSellerDropOff': true,
            //     'isFavorite': true
            //   },
            // ];
            // Navigator.pushNamed(context, RouteManager.routeUserProducts,
            //     arguments: products);
            // },
          },
          type: ButtonType.transparentOutlined,
          size: ButtonSize.large,
          txtSize: BtnTxtSize.large,
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
          txtSize: BtnTxtSize.large,
          leftIcon: CupertinoIcons.doc_on_clipboard,
          rightIcon: CupertinoIcons.chevron_forward,
        ),
        RegainButtons(
          text: 'Addresses',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManageAddresses()),
            );
          },
          type: ButtonType.transparentOutlined,
          size: ButtonSize.large,
          txtSize: BtnTxtSize.large,
          leftIcon: Icons.location_pin,
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
          txtSize: BtnTxtSize.large,
          size: ButtonSize.large,
          leftIcon: CupertinoIcons.creditcard,
          rightIcon: CupertinoIcons.chevron_forward,
        ),
        RegainButtons(
          text: 'Penalty points',
          onPressed: () {
            int? points = Provider.of<AppDataProvider>(context, listen: false)
                .user!
                .penaltyPoints;
            points ??= 1;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PenaltyPage(penaltyPoints: points),
              ),
            );
          },
          type: ButtonType.transparentOutlined,
          size: ButtonSize.large,
          txtSize: BtnTxtSize.large,
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
          txtSize: BtnTxtSize.large,
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
          txtSize: BtnTxtSize.large,
          leftIcon: CupertinoIcons.chat_bubble_2,
          rightIcon: CupertinoIcons.chevron_forward,
        ),
        const SizedBox(
          height: ReGainSizes.spaceBtwSections,
        ),
        RegainButtons(
          text: 'Logout',
          onPressed: () {
            Provider.of<AppDataProvider>(context, listen: false).resetUser();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
            ReGainHelperFunctions.showSnackBar(
                context, "Logged out successfully");
          },
          type: ButtonType.filled,
          txtSize: BtnTxtSize.large,
          size: ButtonSize.large,
        ),
      ],
    );
  }
}
