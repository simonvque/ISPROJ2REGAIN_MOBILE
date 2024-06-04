import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ReGainTextFormFieldTheme{
  ReGainTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,

    labelStyle: const TextStyle().copyWith(fontSize: 14, color: black),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: black.withOpacity(0.08)),

    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular (14),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),

    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular (14),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),

    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular (14),
      borderSide: const BorderSide(width: 1, color: Colors.black12),
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular (14),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),

    focusedErrorBorder: const OutlineInputBorder() .copyWith(
      borderRadius: BorderRadius.circular (14),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  );
}