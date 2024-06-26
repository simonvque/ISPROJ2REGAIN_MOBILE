import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/chatfeatures/chat.dart';
import 'package:regain_mobile/features/screens/homepage/homepage.dart';
import 'package:regain_mobile/features/screens/login/login.dart';
import 'package:regain_mobile/features/screens/orders/myorders.dart';
import 'package:regain_mobile/features/screens/offer/checkout.dart';
import 'package:regain_mobile/features/screens/orders/review.dart';
import 'package:regain_mobile/features/screens/registration/registration_otp.dart';
import 'package:regain_mobile/features/screens/registration/registration_verified.dart';
import 'package:regain_mobile/features/screens/homepage/selected_item.dart';
import 'package:regain_mobile/nav.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu.dart';
import 'package:regain_mobile/features/screens/profile/profile_page.dart';
import 'package:regain_mobile/features/screens/profile/report_page.dart';
import 'package:regain_mobile/features/screens/profile/seller_profile_page.dart';
import 'package:regain_mobile/themes/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // TRY THIS: Try running your application with "flutter run". You'll see
    //     // the application has a purple toolbar. Then, without quitting the app,
    //     // try changing the seedColor in the colorScheme below to Colors.green
    //     // and then invoke "hot reload" (save your changes or press the "hot
    //     // reload" button in a Flutter-supported IDE, or press "r" if you used
    //     // the command line to start the app).
    //     //
    //     // Notice that the counter didn't reset back to zero; the application
    //     // state is not lost during the reload. To reset the state, use hot
    //     // restart instead.
    //     //
    //     // This works for code too, not just values: Most code changes can be
    //     // tested with just a hot reload.
    //     colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF12CF8A)),
    //     useMaterial3: true,
    //   ),
    //   home: const NavigationMenu(),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Regain',
      theme: AppTheme.lightTheme,
      // theme: ThemeData(
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      //   appBarTheme: AppBarTheme(color: Color(0xFF12CF8A)),
      // ),

      home: NavigationMenu(),
    );
  }
}
