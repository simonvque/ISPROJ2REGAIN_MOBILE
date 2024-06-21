import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/features/screens/profile/edit_profile_page.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Contact us'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 350,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 12),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Subject",
                  hintStyle: TextStyle(fontSize: 12),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const SizedBox(
              width: 350,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Please elaborate your concern here",
                  hintStyle: TextStyle(fontSize: 12),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
            ),
            const SizedBox(height: 100),
            SizedBox(
                width: 350,
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
                    child: const Text('Submit'))),
          ],
        ),
      ),
    );
  }
}
