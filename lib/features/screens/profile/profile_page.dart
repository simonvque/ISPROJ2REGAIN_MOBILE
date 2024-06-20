import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/image_strings.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/features/screens/profile/edit_profile_page.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu.dart';
import 'package:regain_mobile/features/screens/profile/util/user_data.dart';

import '../../../themes/elements/button_styles.dart';

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
                height: ReGainSizes.minimalSpace,
              ),
              StyleUsernameTxt('@${user.username}'),
              StyleBodyTxt(user.contactNum),
              const SizedBox(
                height: ReGainSizes.minimalSpace,
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
              // SizedBox(
              //     width: 222,
              //     child: FilledButton(
              //         style: FilledButton.styleFrom(
              //             backgroundColor: green,
              //             foregroundColor: white,
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(8))),
              //         onPressed: () {
              //         },
              //         child: const Text('Edit profile'))),
              const SizedBox(
                height: ReGainSizes.largeSpace,
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
