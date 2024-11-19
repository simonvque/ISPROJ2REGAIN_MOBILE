import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/user_id_model.dart';
import 'package:regain_mobile/model/user_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/features/screens/registration/registration_complete_page.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

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

  String? errorTxt;

  //final idTypeController = TextEditingController();
  String? idType;
  final idNumController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  late DateTime? _selectedDateTime;
  final bdayController = TextEditingController();

  void _addUserID() {
    if (_regIDKey.currentState!.validate()) {
      final submittedUser = UserModel(
        lastName: lastNameController.text.trim(),
        firstName: firstNameController.text.trim(),
        username: widget.user.username,
        email: widget.user.email,
        password: widget.user.password,
        birthday: _selectedDateTime,
      );
      final userIDDetails = UserIDModel(
        user: submittedUser,
        idType: idType,
        idNumber: idNumController.text.trim(),
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
        } else if (response.statusCode != 200) {
          setState(() {
            errorTxt = response.message;
          });
        }
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
                child: Container(
                  width: screenWidth > 600 ? 150 : 100,
                  height: screenWidth > 600 ? 150 : 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.grey,
                    size: screenWidth > 600 ? 60 : 40,
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
              TextFormField(
                controller: idNumController,
                decoration: InputDecoration(
                  errorText: errorTxt,
                  errorMaxLines: 2,
                  hintText: 'Enter your ID Number',
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: green),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the ID number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'First name:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  hintText: 'Enter your first name',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: green),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a first name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Last name:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  hintText: 'Enter your last name',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: green),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a last name";
                  }
                  return null;
                },
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
              TextFormField(
                controller: bdayController,
                readOnly: true,
                onTap: () async {
                  _selectedDateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (_selectedDateTime != null) {
                    //validation code here
                    bdayController.text =
                        DateFormat.yMMMd().format(_selectedDateTime!);
                  }
                },
                decoration: const InputDecoration(
                  hintText: 'Select your Birth Date',
                  suffixIcon: Icon(Icons.calendar_today),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: green),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid date";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: ReGainSizes.spaceBtwSections,
              ),
              RegainButtons(
                text: ReGainTexts.signUp,
                onPressed: () {
                  _addUserID();
                },
                type: ButtonType.filled,
                txtSize: BtnTxtSize.large,
                size: ButtonSize.large,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
