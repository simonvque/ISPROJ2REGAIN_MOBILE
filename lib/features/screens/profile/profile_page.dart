import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/features/screens/profile/util/user_data.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/routes/route_manager.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../themes/elements/button_styles.dart';
import 'profile_menu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppDataProvider>(context, listen: false).user;

    return Scaffold(
      appBar: buildAppBar(context, 'My profile'),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(ReGainImages.exProfilePic),
              ),
              const SizedBox(
                height: ReGainSizes.spaceBtwItems / 4,
              ),
              Text(
                '@${user!.username}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                user.contactNumber!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: ReGainSizes.spaceBtwItems,
              ),
              RegainButtons(
                text: 'Edit profile',
                onPressed: () {
                  Navigator.pushNamed(context, RouteManager.routeEditProfile);
                },
                type: ButtonType.filled,
                size: ButtonSize.small,
                txtSize: BtnTxtSize.medium,
              ),
              const SizedBox(
                height: ReGainSizes.spaceBtwItems,
              ),
              RegainButtons(
                text: 'My orders',
                onPressed: () {
                  Navigator.pushNamed(context, RouteManager.routeOrderTracking);
                },
                type: ButtonType.text,
                size: ButtonSize.small,
                txtSize: BtnTxtSize.large,
                leftIcon: CupertinoIcons.bag,
              ),
              const SizedBox(
                height: ReGainSizes.spaceBtwItems,
              ),
              const ProfileMenu()
            ],
          ),
        ),
      ),
    );
  }
}
