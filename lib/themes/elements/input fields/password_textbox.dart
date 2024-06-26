import 'package:flutter/material.dart';
import 'package:regain_mobile/themes/elements/input%20fields/regain_textbox.dart';

import '../../../constants/colors.dart';

class PasswordTextFormField extends StatefulWidget {
  final String labelText;
  final Color focusedBorderColor;
  final TextEditingController? controller;
  final bool isUnderlineBorder;

  const PasswordTextFormField({
    Key? key,
    required this.labelText,
    this.controller,
    this.focusedBorderColor = green,
    this.isUnderlineBorder = false,
  }) : super(key: key);

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
      obscureText: !_isPasswordVisible,
      isUnderlineBorder: widget.isUnderlineBorder,
      suffixIcon: IconButton(
        icon: _isPasswordVisible
            ? Icon(Icons.visibility_off)
            : Icon(Icons.visibility),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      ),
    );
  }
}
