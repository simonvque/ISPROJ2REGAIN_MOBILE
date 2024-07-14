import 'package:flutter/material.dart';
import 'package:regain_mobile/themes/elements/input%20fields/regain_textbox.dart';

import '../../../constants/colors.dart';

class PasswordTextFormField extends StatefulWidget {
  final String labelText;
  final Color focusedBorderColor;
  TextEditingController? controller;
  final bool isUnderlineBorder;
  FormFieldValidator<String>? validator;

  PasswordTextFormField({
    super.key,
    this.controller,
    this.validator,
    required this.labelText,
    this.focusedBorderColor = green,
    this.isUnderlineBorder = false,
  });

  @override
  PasswordTextFormFieldState createState() => PasswordTextFormFieldState();
}

class PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return RegainTextbox(
      controller: widget.controller,
      labelText: widget.labelText,
      focusedBorderColor: widget.focusedBorderColor,
      validator: widget.validator,
      obscureText: !_isPasswordVisible,
      isUnderlineBorder: widget.isUnderlineBorder,
      suffixIcon: IconButton(
        icon: _isPasswordVisible
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      ),
    );
  }
}
