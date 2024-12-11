import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/colors.dart';

class RegainDatePicker extends StatefulWidget {
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
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool readOnly; // Added for read-only support
  final VoidCallback? onTap; // Added for onTap support

  String? errorText;

  RegainDatePicker({
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
    this.onChanged,
    this.readOnly = false, // Default is false
    this.onTap, // Default is null
  });

  @override
  State<RegainDatePicker> createState() => _RegainDatePickerState();
}

class _RegainDatePickerState extends State<RegainDatePicker> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly, // Apply read-only property
      onTap: widget.onTap, // Apply onTap property
      style: TextStyle(color: widget.fontColor),
      decoration: InputDecoration(
        errorText: widget.errorText,
        errorMaxLines: 10,
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
