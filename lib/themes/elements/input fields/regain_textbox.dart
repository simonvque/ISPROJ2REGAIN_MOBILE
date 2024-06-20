// TODO Implement this library.import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';


class RegainTextbox extends StatelessWidget {
  final String labelText;
  final Color focusedBorderColor;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isUnderlineBorder;

  const RegainTextbox({
    Key? key,
    required this.labelText,
    this.focusedBorderColor = green,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.isUnderlineBorder = false, // Default to border on all sides
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
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
