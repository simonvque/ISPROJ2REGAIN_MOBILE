import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/profile/report_page.dart';
import 'package:regain_mobile/constants/colors.dart';

AppBar buildAppBar(BuildContext context, dynamic title,
    {bool showReportButton = false}) {
  return AppBar(
    backgroundColor: green,
    // leading: const BackButton(
    //   color: white,
    // ),
    iconTheme: const IconThemeData(
        color: white), // no need for BackButton so it'll be automatic
    centerTitle: false,
    titleSpacing: 1.0,
    title: Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 0, 0, 0), // adjust if needed
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
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
