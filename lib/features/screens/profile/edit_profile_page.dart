import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/image_strings.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/user_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/routes/route_manager.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late UserModel model;

  final usernameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final junkshopController = TextEditingController();

  final _profileKey = GlobalKey<FormState>();

  bool usernameNotEditable = true;

  String? _errorMessage;
  File? _profileImage; // To store the selected profile image

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() {
    model = Provider.of<AppDataProvider>(context, listen: false).user!;
    usernameController.text = model.username;
    firstNameController.text = model.firstName ?? "";
    lastNameController.text = model.lastName ?? "";
    emailController.text = model.email ?? "";
    junkshopController.text = model.junkshopName ?? "";
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Edit profile'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _profileKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile Picture Section
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _profileImage != null
                          ? FileImage(
                              _profileImage!) // Use FileImage for the selected File
                          : (model.profileImage != null &&
                                  model.profileImage!.isNotEmpty
                              ? MemoryImage(model
                                  .profileImage!) // Use MemoryImage for Uint8List
                              : const AssetImage(ReGainImages
                                      .exProfilePic) // Default asset
                                  as ImageProvider<Object>),
                    ),
                    const SizedBox(height: 2),
                    TextButton(
                      onPressed: _pickImage,
                      child: Text(
                        'Change Profile Picture',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: green),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Personal Information Section
              Text(
                'Personal Information',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: usernameController,
                readOnly: usernameNotEditable,
                decoration: InputDecoration(
                    errorText: _errorMessage,
                    labelText: "Username",
                    hintText: "Your unique username",
                    hintStyle: const TextStyle(fontSize: 12),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: green)),
                    floatingLabelStyle: const TextStyle(color: green)),
              ),
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(
                    labelText: "First name",
                    hintText: "Enter first name",
                    hintStyle: TextStyle(fontSize: 12),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: green)),
                    floatingLabelStyle: TextStyle(color: green)),
              ),
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(
                    labelText: "Last name",
                    hintText: "Enter last name",
                    hintStyle: TextStyle(fontSize: 12),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: green)),
                    floatingLabelStyle: TextStyle(color: green)),
              ),
              const SizedBox(height: 10),

              Text(
                'Junk Shop Information',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: junkshopController,
                decoration: const InputDecoration(
                    labelText: "Junk Shop Name",
                    hintText: "Enter junk shop name",
                    hintStyle: TextStyle(fontSize: 12),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: green)),
                    floatingLabelStyle: TextStyle(color: green)),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RegainButtons(
                        text: 'Save',
                        onPressed: updateProfile,
                        type: ButtonType.filled,
                        size: ButtonSize.large,
                        txtSize: BtnTxtSize.large,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateProfile() {
    if (_profileKey.currentState!.validate()) {
      final user = UserModel(
        id: model.id,
        username: model.username,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        junkshopName: junkshopController.text,
        accountStatus: model.accountStatus,
        password: model.password!,
      );
      Provider.of<AppDataProvider>(context, listen: false)
          .updateUser(user, profileImage: _profileImage)
          .then((response) {
        if (response.statusCode == 200) {
          Navigator.pushNamed(context, RouteManager.routeNavMenu);
          ReGainHelperFunctions.showSnackBar(
              context, 'Profile updated successfully!');
        } else {
          ReGainHelperFunctions.showSnackBar(
              context, 'Failed to update profile.');
        }
      });
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    junkshopController.dispose();
    super.dispose();
  }
}
