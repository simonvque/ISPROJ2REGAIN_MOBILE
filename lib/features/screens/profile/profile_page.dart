import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/features/screens/profile/util/user_data.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../themes/elements/button_styles.dart';
import 'edit_profile_page.dart';
import 'profile_menu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserData().myUser;

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
              StyleUsernameTxt('@${user.username}'),
              StyleBodyTxt(user.contactNum),
              const SizedBox(
                height: ReGainSizes.spaceBtwItems,
              ),
              RegainButtons(
                text: 'Edit profile',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfilePage()));
                },
                type: ButtonType.filled,
                size: ButtonSize.small,
              ),
              const SizedBox(
                height: ReGainSizes.spaceBtwItems,
              ),
              RegainButtons(
                text: 'My orders',
                onPressed: () {},
                type: ButtonType.text,
                size: ButtonSize.small,
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

class StyleBodyTxt extends StatelessWidget {
  const StyleBodyTxt(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ));
  }
}

class StyleUsernameTxt extends StatelessWidget {
  const StyleUsernameTxt(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ));
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
