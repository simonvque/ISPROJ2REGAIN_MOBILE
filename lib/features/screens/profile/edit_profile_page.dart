import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/image_strings.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/features/validations/form_validators.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/user_profile_update_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/routes/route_manager.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late UserProfileUpdateModel model;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final junkshopController = TextEditingController();

  final _profileKey = GlobalKey<FormState>();

  bool usernameNotEditable = true;

  String? _errorMessage;
  File? _profileImage; // To store the selected profile image
  File? _gcashQRCode; // To store the selected GCASH QR Code

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() {
    final user = Provider.of<AppDataProvider>(context, listen: false).user!;
    model = UserProfileUpdateModel(
      id: user.id,
      username: user.username,
      firstName: user.firstName,
      lastName: user.lastName,
      junkshopName: user.junkshopName,
      profileImage: user.profileImage,
      gcashQRcode: user.gcashQRcode,
    );
    usernameController.text = model.username;
    emailController.text = user.email!;
    firstNameController.text = model.firstName ?? "";
    lastNameController.text = model.lastName ?? "";
    junkshopController.text = model.junkshopName ?? "";
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final fileSize = file.lengthSync();
      final mimeType = lookupMimeType(file.path);

      if (fileSize > 2 * 1024 * 1024) {
        // 2MB limit
        ReGainHelperFunctions.showSnackBar(
            context, 'Image size must be under 2MB.');
        return;
      }

      if (mimeType != 'image/jpeg' && mimeType != 'image/png') {
        ReGainHelperFunctions.showSnackBar(
            context, 'Invalid image format. Only JPEG and PNG are supported.');
        return;
      }

      setState(() {
        _profileImage = file;
      });
    }
  }

  Future<void> _pickGCashQRCode() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final fileSize = file.lengthSync();
      final mimeType = lookupMimeType(file.path);

      if (fileSize > 2 * 1024 * 1024) {
        // 2MB limit
        ReGainHelperFunctions.showSnackBar(
            context, 'File size must be under 2MB.');
        return;
      }

      if (mimeType != 'image/jpeg' && mimeType != 'image/png') {
        ReGainHelperFunctions.showSnackBar(
            context, 'Invalid image format. Only JPEG and PNG are supported.');
        return;
      }

      setState(() {
        _gcashQRCode = file;
      });

      ReGainHelperFunctions.showSnackBar(
          context, 'Code selected successfully!');
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
                readOnly: true, // Makes the field non-editable
                decoration: InputDecoration(
                  errorText: _errorMessage,
                  labelText: "Username",
                  hintText: "Your unique username",
                  hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200], // Light grey background
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: green),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  floatingLabelStyle: const TextStyle(color: green),
                  labelStyle: const TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(
                    color: Colors.grey), // Text color for non-editable look
              ),

              TextFormField(
                controller: emailController,
                readOnly: true, // Makes the field non-editable
                decoration: InputDecoration(
                  errorText: _errorMessage,
                  labelText: "Email",
                  hintText: "Your unique email address",
                  hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200], // Light grey background
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: green),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  floatingLabelStyle: const TextStyle(color: green),
                  labelStyle: const TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(
                    color: Colors.grey), // Text color for non-editable look
              ),

              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  labelText: "First name",
                  hintText: "Enter first name",
                  hintStyle: TextStyle(fontSize: 12),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: green),
                  ),
                  floatingLabelStyle: TextStyle(color: green),
                ),
                validator: (value) =>
                    Validators.nameValidation(value, fieldName: 'first name'),
              ),

              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  labelText: "Last name",
                  hintText: "Enter last name",
                  hintStyle: TextStyle(fontSize: 12),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: green),
                  ),
                  floatingLabelStyle: TextStyle(color: green),
                ),
                validator: (value) =>
                    Validators.nameValidation(value, fieldName: 'last name'),
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
                    borderSide: BorderSide(color: green),
                  ),
                  floatingLabelStyle: TextStyle(color: green),
                  errorMaxLines: 10,
                ),
                validator: (value) => Validators.junkShopNameValidation(value,
                    fieldName: 'junk shop name'),
              ),

              const SizedBox(height: 10),

              // GCASH QR Code Upload
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GCASH QR Code',
                    style: Theme.of(context).textTheme.titleMedium
                      ?..copyWith(
                        fontWeight: FontWeight.bold, // Make text bold
                      ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _gcashQRCode != null
                              ? 'Uploaded: ${_gcashQRCode!.path.split('/').last}'
                              : model.gcashQRcode != null
                                  ? 'Already Uploaded'
                                  : 'Not Uploaded',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: _gcashQRCode != null ||
                                            model.gcashQRcode != null
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.upload_file, color: green),
                        onPressed: _pickGCashQRCode,
                      ),
                    ],
                  ),
                ],
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
      final updatedProfile = UserProfileUpdateModel(
        id: model.id,
        username: model.username,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        junkshopName: junkshopController.text.trim(),
      );

      Provider.of<AppDataProvider>(context, listen: false)
          .updateUserProfile(
        updatedProfile,
        profileImage: _profileImage,
        gcashQRcode: _gcashQRCode,
      )
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          Navigator.pushNamed(context, RouteManager.routeNavMenu);
          ReGainHelperFunctions.showSnackBar(
              context, 'Profile updated successfully!');
        } else {
          ReGainHelperFunctions.showSnackBar(
              context, response.message ?? 'Failed to update profile.');
        }
      }).catchError((error) {
        ReGainHelperFunctions.showSnackBar(
            context, 'An unexpected error occurred: $error');
      });
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    junkshopController.dispose();
    super.dispose();
  }
}
