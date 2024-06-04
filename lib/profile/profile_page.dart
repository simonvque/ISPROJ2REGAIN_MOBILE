import 'package:flutter/material.dart';
import 'package:regain_mobile/profile/app_bar.dart';
import 'package:regain_mobile/profile/edit_profile_page.dart';
import 'package:regain_mobile/profile/profile_menu.dart';
import 'package:regain_mobile/profile/util/user_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'My profile'),
      body: const UserProfile(),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserData().myUser;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  image: AssetImage(user.imagePath),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            height: 5,
          ),
          StyleUsernameTxt('@${user.username}'),
          StyleBodyTxt(user.contactNum),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
              width: 222,
              child: FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfilePage()));
                  },
                  child: const Text('Edit profile'))),
          const SizedBox(
            height: 30,
          ),
          const ProfileMenu()
        ],
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
