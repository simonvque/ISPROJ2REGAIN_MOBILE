import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/listings/add.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/features/screens/listings/add_product.dart';
import 'package:regain_mobile/features/screens/awareness/awareness.dart';
import 'package:regain_mobile/features/screens/chatfeatures/chat.dart';
import 'package:regain_mobile/features/screens/homepage/homepage.dart';
import 'package:regain_mobile/features/screens/login/login.dart';
import 'package:regain_mobile/features/screens/orders/myorders.dart';
import 'package:regain_mobile/features/screens/offer/checkout.dart';
import 'package:regain_mobile/features/screens/orders/review.dart';
import 'package:regain_mobile/features/screens/registration/registration.dart';
import 'package:regain_mobile/features/screens/registration/registration_otp.dart';
import 'package:regain_mobile/features/screens/registration/registration_verified.dart';
import 'package:regain_mobile/features/screens/homepage/selected_item.dart';
import 'package:regain_mobile/nav.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu.dart';
import 'package:regain_mobile/features/screens/profile/profile_page.dart';
import 'package:regain_mobile/features/screens/profile/report_page.dart';
import 'package:regain_mobile/features/screens/profile/seller_profile_page.dart';
import 'package:regain_mobile/themes/theme.dart';

import 'features/screens/offer/offerpopup.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppDataProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Regain',
      theme: AppTheme.lightTheme,
      // theme: ThemeData(
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      //   appBarTheme: AppBarTheme(color: Color(0xFF12CF8A)),
      // ),

      home: LoginScreen(),
      routes: {
        routeLogin: (context) => LoginScreen(),
        routeHomepage: (context) => HomepageScreen(),
        routeNavMenu: (context) => NavigationMenu(),
        routeRegistration: (context) => RegistrationScreen(),
        routeProfilePage: (context) => ProfilePage(),
        routeAdd: (context) => Add(),
      },
    );
  }
}
