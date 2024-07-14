import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/profile/report_page.dart';
import 'package:regain_mobile/features/screens/profile/user_report_page.dart';

AppBar buildAppBar(BuildContext context, String title, {
        VoidCallback? onBackPressed, bool showReportButton = false})
     {
  return AppBar(
    backgroundColor: green,
    iconTheme: const IconThemeData(color: Colors.white),
    centerTitle: false,
    titleSpacing: 1.0,
    title: Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    ),
    leading: onBackPressed != null
        ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onBackPressed,
          )
        : null,
    actions: showReportButton
  ? [
      IconButton(
        icon:const Icon(CupertinoIcons.flag, color: Colors.white),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.90,
                // padding: EdgeInsets.only(
                //   bottom: MediaQuery.of(context).viewInsets.bottom,
                // ),
                child: const UserReportPage(), 
              );
            },
          );
        },
      ),
    ]
  : null,
  );
}
