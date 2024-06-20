import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu.dart';

class ChangePWPage extends StatelessWidget {
  const ChangePWPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Change password'),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyleLabelTxt('Current password'),
            SizedBox(
              width: 350,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter current password",
                  hintStyle: TextStyle(fontSize: 12),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
            ),
            SizedBox(height: 50),
            StyleLabelTxt('New password'),
            SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter new password",
                  hintStyle: TextStyle(fontSize: 12),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
            ),
            SizedBox(height: 20),
            StyleLabelTxt('Confirm new password'),
            SizedBox(
              width: 350,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Reenter new password",
                  hintStyle: TextStyle(fontSize: 12),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
