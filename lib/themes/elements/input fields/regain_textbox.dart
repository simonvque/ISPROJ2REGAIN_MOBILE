import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class RegainTextbox extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Color focusedBorderColor;
  final Color borderColor;
  final Color fontColor;
  final Color iconColor;
  final Color fillColor;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isUnderlineBorder;
  final TextEditingController? controller;

  const RegainTextbox({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.focusedBorderColor = green,
    this.borderColor = white,
    this.fontColor = black,
    this.iconColor = black,
    this.fillColor = white,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.isUnderlineBorder = false, // Default to border on all sides
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(color: fontColor),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: fontColor),
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