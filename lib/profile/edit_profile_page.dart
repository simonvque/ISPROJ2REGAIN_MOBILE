import 'package:regain_mobile/profile/app_bar.dart';
import 'package:flutter/material.dart';


class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Edit profile')
    );
  }
}