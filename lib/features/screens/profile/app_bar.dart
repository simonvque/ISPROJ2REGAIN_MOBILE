import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/profile/report_page.dart';
import 'package:regain_mobile/constants/colors.dart';

//TO FIX: TEXT STYLE FROM THEME

AppBar buildAppBar(BuildContext context, dynamic title,
    {bool showReportButton = false}) {
  return AppBar(
    backgroundColor: green,
    leading: const BackButton(
      color: white,
    ),
    centerTitle: false,
    titleSpacing: 1.0,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
    actions: showReportButton
        ? [
            IconButton(
              icon: const Icon(Icons.flag_outlined, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportPage()));
              },
            ),
          ]
        : null,
  );
}
