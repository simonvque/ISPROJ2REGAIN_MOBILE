import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/image_strings.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/login/login.dart';
import 'package:regain_mobile/model/user_model.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/user_profile_update_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/routes/route_manager.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  late UserProfileUpdateModel model;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final junkshopController = TextEditingController();

  final _profileKey = GlobalKey<FormState>();

  bool NotEditable = true;

  String? _errorMessage;

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

  void _deleteUser() {
    if (_profileKey.currentState!.validate()) {
      final user = Provider.of<AppDataProvider>(context, listen: false).user!;
      final deleteUser = UserModel(
          id: user.id,
          username: user.username,
          password: passwordController.text,
          accountStatus: "Deleted");
      Provider.of<AppDataProvider>(context, listen: false)
          .deleteUser(user.id!, deleteUser)
          .then((response) {
        if (response.statusCode == 200) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
          ReGainHelperFunctions.showSnackBar(
              context, "User deleted successfully");
        } else {
          setState(() {
            _errorMessage = response.message;
          });
        }
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

              const SizedBox(height: 12),

              // Personal Information Section
              Text(
                'Personal Information',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: usernameController,
                readOnly: NotEditable,
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
                controller: emailController,
                readOnly: NotEditable,
                decoration: InputDecoration(
                    errorText: _errorMessage,
                    labelText: "Email",
                    hintText: "Your unique username",
                    hintStyle: const TextStyle(fontSize: 12),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: green)),
                    floatingLabelStyle: const TextStyle(color: green)),
              ),
              TextFormField(
                controller: firstNameController,
                readOnly: NotEditable,
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
                readOnly: NotEditable,
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
                readOnly: NotEditable,
                decoration: const InputDecoration(
                    labelText: "Junk Shop Name",
                    hintText: "Enter junk shop name",
                    hintStyle: TextStyle(fontSize: 12),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: green)),
                    floatingLabelStyle: TextStyle(color: green)),
              ),
              const SizedBox(height: 10),

              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RegainButtons(
                        text: 'Delete Account',
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              bool showPassword = false;
                              passwordController.text = "";

                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return AlertDialog(
                                  title: Row(
                                    children: [
                                      const Icon(
                                          CupertinoIcons
                                              .exclamationmark_triangle,
                                          color: red),
                                      const SizedBox(width: 8),
                                      Text(
                                        "Deleting account",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                  content: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .20,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Are you sure you want to delete your account? Please enter your password.",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                          ),
                                          Expanded(
                                            child: TextField(
                                              controller: passwordController,
                                              obscureText: !showPassword,
                                              decoration: InputDecoration(
                                                labelText: "Password",
                                                // prefixIcon:
                                                //     const Icon(Icons.lock),
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    showPassword
                                                        ? Icons.visibility
                                                        : Icons.visibility_off,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      showPassword =
                                                          !showPassword;
                                                    });
                                                  },
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: const BorderSide(
                                                      color: green),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // Close the dialog
                                      },
                                      child: Text(
                                        ReGainTexts.btnCancel,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // delete function here <<<<<<<<<<<<<
                                        //deleteProduct();
                                        Navigator.pop(context);
                                        _deleteUser();
                                      },
                                      child: Text(
                                        ReGainTexts.btnDelete,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(color: red),
                                      ),
                                    ),
                                  ],
                                );
                              });
                            },
                          );
                        },
                        type: ButtonType.filled,
                        size: ButtonSize.large,
                        txtSize: BtnTxtSize.large,
                        customColor: Colors.red.shade300,
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

  Widget? showModal() {}

  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    junkshopController.dispose();
    super.dispose();
  }
}
