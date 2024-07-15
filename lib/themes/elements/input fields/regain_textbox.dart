import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/colors.dart';

class RegainTextbox extends StatefulWidget {
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
  TextEditingController? controller;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;

  String? errorText;
  final bool obscureText;

  RegainTextbox({
    super.key,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.errorText,
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
  });

  @override
  State<RegainTextbox> createState() => _RegainTextboxState();
}

class _RegainTextboxState extends State<RegainTextbox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.obscureText,
      style: TextStyle(color: widget.fontColor),
      decoration: InputDecoration(
        errorText: widget.errorText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: widget.hintAndLabelTextColor),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: widget.hintAndLabelTextColor),
        prefixIcon: widget.prefixIcon != null
            ? IconTheme(
                data: IconThemeData(color: widget.iconColor),
                child: widget.prefixIcon!,
              )
            : null,
        suffixIcon: widget.suffixIcon != null
            ? IconTheme(
                data: IconThemeData(color: widget.iconColor),
                child: widget.suffixIcon!,
              )
            : null,
        filled: true,
        fillColor: widget.fillColor,
        border: widget.isUnderlineBorder
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: widget.focusedBorderColor),
              )
            : OutlineInputBorder(
                borderSide: BorderSide(color: widget.focusedBorderColor),
              ),
        focusedBorder: widget.isUnderlineBorder
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: widget.focusedBorderColor),
              )
            : OutlineInputBorder(
                borderSide: BorderSide(color: widget.focusedBorderColor),
              ),
      ),
    );
  }
}
