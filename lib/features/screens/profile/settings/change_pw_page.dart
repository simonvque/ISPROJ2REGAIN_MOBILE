import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/model/user_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

import '../../../../themes/elements/input fields/password_textbox.dart';

class ChangePWPage extends StatefulWidget {
  const ChangePWPage({super.key});

  @override
  State<ChangePWPage> createState() => _ChangePWPageState();
}

class _ChangePWPageState extends State<ChangePWPage> {
  late UserModel model;

  final usernameController = TextEditingController();
  final currentPWController = TextEditingController();
  final confirmPWController = TextEditingController();
  final newPWController = TextEditingController();

  final GlobalKey<FormState> _changePWKey = GlobalKey<FormState>();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() {
    model = Provider.of<AppDataProvider>(context, listen: false).user!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Change password'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: _changePWKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: usernameController,
                      ),
                      Text(
                        'Verify your current password:',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      PasswordTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty || value == "") {
                            return "Please enter your current password";
                          }
                          return null;
                        },
                        controller: currentPWController,
                        labelText: ReGainTexts.currentPW,
                        isUnderlineBorder: true,
                      ),
                      const SizedBox(height: ReGainSizes.largeSpace),
                      Text(
                        'Update your new password:',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      PasswordTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty || value == "") {
                            return "Please enter a new password";
                          }
                          return null;
                        },
                        controller: newPWController,
                        labelText: ReGainTexts.newPW,
                        isUnderlineBorder: true,
                      ),
                      const SizedBox(height: ReGainSizes.spaceBtwInputFields),
                      PasswordTextFormField(
                        validator: (value) {
                          String confirmValue = newPWController.text;
                          if (value == null ||
                              value.isEmpty ||
                              value == "" ||
                              value != confirmValue) {
                            return "Please confirm your password";
                          }
                          return null;
                        },
                        controller: confirmPWController,
                        labelText: ReGainTexts.confirmPassword,
                        isUnderlineBorder: true,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: RegainButtons(
                          text: 'Save',
                          onPressed: () {
                            //updatePassword();
                          },
                          type: ButtonType.filled,
                          size: ButtonSize.large,
                          txtSize: BtnTxtSize.large,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // void updatePassword() {
  //   if (_changePWKey.currentContext!.validate()) {
  //     final user = UserModel(
  //       id: model.id,
  //       username: model.username,
  //       contactNumber: confirmPWController.text,
  //       lastName: currentPWController.text,
  //       password: newPWController.text,
  //     );
  //   }
  // }

  void resetFields() {
    currentPWController.clear();
    newPWController.clear();
    confirmPWController.clear();
  }

  @override
  void dispose() {
    currentPWController.dispose();
    newPWController.dispose();
    confirmPWController.dispose();

    super.dispose();
  }
}
