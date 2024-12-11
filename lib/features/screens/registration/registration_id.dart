import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/validations/form_validators.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/user_id_model.dart';
import 'package:regain_mobile/model/user_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/features/screens/registration/registration_complete_page.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';
import 'package:regain_mobile/themes/elements/input%20fields/regain_datepicker.dart';
import 'package:regain_mobile/themes/elements/input%20fields/regain_textbox.dart';

class RegistrationIDPage extends StatefulWidget {
  final UserModel user;

  const RegistrationIDPage({
    super.key,
    required this.user,
  });

  @override
  State<RegistrationIDPage> createState() => _RegistrationIDPageState();
}

class _RegistrationIDPageState extends State<RegistrationIDPage> {
  final _regIDKey = GlobalKey<FormState>();

  File? _idImageFile;

  String? errorTxt;

  bool _isLoading = false; // To track loading state

  //final idTypeController = TextEditingController();
  String? idType;
  final idNumController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  late DateTime? _selectedDateTime;
  final bdayController = TextEditingController();

  void _addUserID() {
    if (_regIDKey.currentState!.validate()) {
      if (_idImageFile == null) {
        setState(() {
          errorTxt = "Please upload an ID image.";
        });
        return;
      }

      setState(() {
        _isLoading = true; // Start loading
      });

      final submittedUser = UserModel(
        lastName: lastNameController.text.trim(),
        firstName: firstNameController.text.trim(),
        username: widget.user.username,
        email: widget.user.email,
        password: widget.user.password,
        birthday: _selectedDateTime,
      );

      final base64Image = base64Encode(_idImageFile!.readAsBytesSync());

      final userIDDetails = UserIDModel(
        user: submittedUser,
        idType: idType,
        idNumber: idNumController.text.trim(),
        idImage: base64Image, // Add Base64-encoded image
      );

      Provider.of<AppDataProvider>(context, listen: false)
          .addUserID(userIDDetails)
          .then((response) {
        if (response.statusCode == 200) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const RegistrationCompletePage(),
            ),
          );
          ReGainHelperFunctions.showSnackBar(context, response.message);
        } else {
          setState(() {
            errorTxt = response.message;
          });
        }
      }).whenComplete(() {
        setState(() {
          _isLoading = false; // Stop loading
        });
      });
    }
  }

  void resetFields() {
    errorTxt = "";
    idType = null;
    idNumController.clear();
    firstNameController.clear();
    lastNameController.clear();
    bdayController.clear();
    _selectedDateTime = null;
  }

  @override
  void dispose() {
    idNumController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    bdayController.dispose();
    super.dispose();
  }

  Future<void> _pickIDImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _idImageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth > 600 ? 40 : 16;
    double iconSize = screenWidth > 600 ? 60 : 40;
    double fontSize = screenWidth > 600 ? 24 : 20;

    return Scaffold(
      appBar: buildAppBar(context, '', automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Form(
          key: _regIDKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.lock,
                    size: iconSize,
                    color: green,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Additional Step',
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Provide Your ID Information',
                        style: TextStyle(
                          fontSize: fontSize - 4,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Upload your ID:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: _pickIDImage, // Call the image picker
                  child: Container(
                    width: screenWidth > 600 ? 150 : 100,
                    height: screenWidth > 600 ? 150 : 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: _idImageFile != null
                        ? Image.file(_idImageFile!, fit: BoxFit.cover)
                        : Icon(
                            Icons.add,
                            color: Colors.grey,
                            size: screenWidth > 600 ? 60 : 40,
                          ),
                  ),
                ),
              ),
              if (_idImageFile == null && errorTxt != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    errorTxt!,
                    style: const TextStyle(
                      color: red,
                      fontSize: 14,
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              const Text(
                'ID Type:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                hint: const Text('Select ID Type'),
                items: [
                  'Driver’s License',
                  'Passport ',
                  'Postal ID',
                  'National ID',
                  'Phil-health ID',
                  'SSS ID'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  idType = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select an ID type";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'ID Number:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RegainTextbox(
                controller: idNumController,
                validator: (value) => Validators.idNumberValidation(value,
                    fieldName: 'ID number'),
                hintText: 'ID Number',
                isUnderlineBorder: true,
              ),
              const SizedBox(height: 20),
              const Text(
                'First name:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RegainTextbox(
                controller: firstNameController,
                validator: (value) =>
                    Validators.nameValidation(value, fieldName: 'first name'),
                hintText: 'First name',
                isUnderlineBorder: true,
              ),
              const SizedBox(height: 20),
              const Text(
                'Last name:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RegainTextbox(
                controller: lastNameController,
                validator: (value) =>
                    Validators.nameValidation(value, fieldName: 'last name'),
                hintText: 'Last name',
                isUnderlineBorder: true,
              ),
              const SizedBox(height: 20),
              const Text(
                'Birth Date:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              RegainDatePicker(
                controller: bdayController,
                hintText: 'Select your Birth Date',
                readOnly: true,
                suffixIcon: const Icon(Icons.calendar_today),
                onTap: () async {
                  _selectedDateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (_selectedDateTime != null) {
                    // Format and set the selected date
                    bdayController.text =
                        DateFormat.yMMMd().format(_selectedDateTime!);
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a birth date";
                  }

                  // Check if the user is at least 18 years old
                  final DateTime today = DateTime.now();
                  final DateTime? birthDate = _selectedDateTime;

                  if (birthDate == null) {
                    return "Please select a birth date";
                  }

                  final int age = today.year - birthDate.year;
                  final bool hasHadBirthdayThisYear =
                      today.month > birthDate.month ||
                          (today.month == birthDate.month &&
                              today.day >= birthDate.day);

                  if (age < 18 || (age == 18 && !hasHadBirthdayThisYear)) {
                    return "User must be at least 18 years old";
                  }

                  return null;
                },
                isUnderlineBorder: true,
              ),
              const SizedBox(
                height: ReGainSizes.spaceBtwSections,
              ),
              RegainButtons(
                text: ReGainTexts.signUp,
                onPressed: _isLoading
                    ? null // Disable the button when loading
                    : () {
                        _addUserID();
                      }, // Call the _addUserID function when not loading
                type: ButtonType.filled,
                txtSize: BtnTxtSize.large,
                size: ButtonSize.large,
                isLoading: _isLoading, // Pass the loading state
              ),
            ],
          ),
        ),
      ),
    );
  }
}
