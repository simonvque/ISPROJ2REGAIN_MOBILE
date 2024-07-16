import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
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
  final contactNoController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final junkshopController = TextEditingController();

  final _profileKey = GlobalKey<FormState>();

  bool usernameNotEditable = true;

  String? _errorMessage;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() {
    model = Provider.of<AppDataProvider>(context, listen: false).user!;
    usernameController.text = model.username;
    contactNoController.text = model.contactNumber ?? "";
    firstNameController.text = model.firstName ?? "";
    lastNameController.text = model.lastName ?? "";
    emailController.text = model.email ?? "";
    junkshopController.text = model.junkshopName ?? "";
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
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage('https://example.com/profile_image.jpg'),
                    ),
                    const SizedBox(height: 2),
                    TextButton(
                      onPressed: () {},
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
                controller: contactNoController,
                readOnly: true,
                decoration: InputDecoration(
                    errorText: _errorMessage,
                    labelText: "Contact Number",
                    hintText: "Your unique contact number",
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
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "Enter email",
                    hintStyle: TextStyle(fontSize: 12),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: green)),
                    floatingLabelStyle: TextStyle(color: green)),
              ),
              const SizedBox(height: 20),

              // Junk Shop Information Section
              // model.role ?= ""
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

              const SizedBox(height: ReGainSizes.largeSpace),

              Row(
                children: [
                  // Expanded(
                  //   flex: 1,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(5.0)),
                  //         backgroundColor: Colors.grey.shade700,
                  //         foregroundColor: white,
                  //       ),
                  //       child: const Padding(
                  //         padding: EdgeInsets.all(5.0),
                  //         child: Text('Change Username',
                  //             style: TextStyle(
                  //               fontSize: 13.0,
                  //               fontWeight: FontWeight.w800,
                  //               //fontFamily: 'Montserrat',
                  //             )),
                  //       ),
                  //       onPressed: () {
                  //         setState(() {
                  //           usernameNotEditable = false;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RegainButtons(
                        text: 'Save',
                        onPressed: () {
                          updateProfile();
                        },
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
          contactNumber: model.contactNumber,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          junkshopName: junkshopController.text,
          password: model.password!);
      Provider.of<AppDataProvider>(context, listen: false)
          .updateUser(user)
          .then((response) {
        if (response.statusCode == 200) {
          Navigator.pushNamed(context, RouteManager.routeNavMenu);
          ReGainHelperFunctions.showSnackBar(context, response.message);
        } else if (response.statusCode == 400) {
          setState(() {
            _errorMessage = response.message;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    contactNoController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    junkshopController.dispose();
    super.dispose();
  }
}
