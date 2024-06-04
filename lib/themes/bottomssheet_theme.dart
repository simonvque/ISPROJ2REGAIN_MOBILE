import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ReGainBottomSheetTheme{
  ReGainBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: white,
    modalBackgroundColor: white,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}