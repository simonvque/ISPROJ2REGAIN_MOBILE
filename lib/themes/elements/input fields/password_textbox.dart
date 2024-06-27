import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final String labelText;
  final Color focusedBorderColor;
  TextEditingController? controller;
  FormFieldValidator<String>? validator;

  PasswordTextFormField({
    Key? key,
    this.controller,
    this.validator,
    required this.labelText,
    this.focusedBorderColor = Colors.green, // default color if not provided
  }) : super(key: key);

  @override
  PasswordTextFormFieldState createState() => PasswordTextFormFieldState();
}

class PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: widget.labelText,
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
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.focusedBorderColor),
        ),
      ),
    );
  }
}
