import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class RegainTextbox extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Color focusedBorderColor;
  final Color fontColor;
  final Color iconColor;
  final Color fillColor;
  final Color hintAndLabelTextColor;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isUnderlineBorder;
  final TextEditingController? controller;
  final bool obscureText;

  const RegainTextbox({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.focusedBorderColor = green,
    this.fontColor = black,
    this.iconColor = Colors.grey,
    this.fillColor = white,
    this.hintAndLabelTextColor = Colors.grey,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.isUnderlineBorder = false,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(color: fontColor),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: hintAndLabelTextColor),
        hintText: hintText,
        hintStyle: TextStyle(color: hintAndLabelTextColor),
        prefixIcon: prefixIcon != null
            ? IconTheme(
          data: IconThemeData(color: iconColor),
          child: prefixIcon!,
        )
            : null,
        suffixIcon: suffixIcon != null
            ? IconTheme(
          data: IconThemeData(color: iconColor),
          child: suffixIcon!,
        )
            : null,
        filled: true,
        fillColor: fillColor,
        border: isUnderlineBorder
            ? UnderlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
        )
            : OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
        ),
        focusedBorder: isUnderlineBorder
            ? UnderlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
        )
            : OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
    );
  }
}
