import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Edit profile'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Picture Section
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://example.com/profile_image.jpg'), // Replace with user's profile image
                    // Implement onTap to change profile picture
                  ),
                  const SizedBox(height: 2),
                  TextButton(
                    onPressed: () {
                      // Implement logic to change profile picture
                    },
                    child: const Text(
                      'Change Profile Picture',
                      style: TextStyle(color: green),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Personal Information Section
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Enter name",
                  hintStyle: TextStyle(fontSize: 12),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: green)),
                  floatingLabelStyle: TextStyle(color: green)),
              // Implement logic to update name
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter email",
                  hintStyle: TextStyle(fontSize: 12),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: green)),
                  floatingLabelStyle: TextStyle(color: green)),
              // Implement logic to update email
            ),
            const SizedBox(height: 20),

            // Junk Shop Information Section
            const Text(
              'Junk Shop Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Junk Shop Name",
                  hintText: "Enter junk shop name",
                  hintStyle: TextStyle(fontSize: 12),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: green)),
                  floatingLabelStyle: TextStyle(color: green)),
              // Implement logic to update junk shop name
            ),
            const SizedBox(
                height: ReGainSizes
                    .largeSpace), // TO FIX: put button at the bottom w/o using sizedbox?

            RegainButtons(
              text: 'Save',
              onPressed: () {},
              type: ButtonType.filled,
              size: ButtonSize.large,
            )
          ],
        ),
      ),
    );
  }
}
