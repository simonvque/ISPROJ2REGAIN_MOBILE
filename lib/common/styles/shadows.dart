import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';

class ReGainShadowStyle{
  static final verticalProductShadow = BoxShadow(
    color: black.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
    color: black.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
}