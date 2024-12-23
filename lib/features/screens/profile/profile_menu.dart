import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/green_zone/green_zone_page.dart';
import 'package:regain_mobile/features/screens/login/login.dart';
import 'package:regain_mobile/features/screens/orders/my_orders_page.dart';
import 'package:regain_mobile/features/screens/profile/manage_addresses.dart';
import 'package:regain_mobile/features/screens/profile/my_reviews_page.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/commissionBalance/combal_page.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/contactus_page.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/listing_page.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/penalty_page.dart';
import 'package:regain_mobile/features/screens/profile/settings/settings_page.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';

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
                builder: (context) => OrderTrackingPage(
                    // transactions: transactions,
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
          text: 'My Reviews',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyCommentsPage(),
              ),
            );
          },
          type: ButtonType.transparentOutlined,
          size: ButtonSize.large,
          txtSize: BtnTxtSize.large,
          leftIcon: CupertinoIcons.star_circle,
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
          text: 'The Green Zone',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GreenZonePage(),
              ),
            );
          },
          type: ButtonType.transparentOutlined,
          txtSize: BtnTxtSize.large,
          size: ButtonSize.large,
          leftIcon: CupertinoIcons.tree,
          rightIcon: CupertinoIcons.chevron_forward,
        ),
        RegainButtons(
          text: 'Penalty points',
          onPressed: () {
            final appDataProvider =
                Provider.of<AppDataProvider>(context, listen: false);
            final userId = appDataProvider.userId;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PenaltyPage(userId: userId),
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
        // RegainButtons(
        //   text: 'Contact us',
        //   onPressed: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => const ContactUsPage()));
        //   },
        //   type: ButtonType.transparentOutlined,
        //   size: ButtonSize.large,
        //   txtSize: BtnTxtSize.large,
        //   leftIcon: CupertinoIcons.chat_bubble_2,
        //   rightIcon: CupertinoIcons.chevron_forward,
        // ),
        const SizedBox(
          height: ReGainSizes.spaceBtwSections,
        ),
        RegainButtons(
          text: 'Logout',
          onPressed: () {
            Provider.of<AppDataProvider>(context, listen: false).resetUser();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false);
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
