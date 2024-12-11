import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/features/screens/chatfeatures/notificationservice.dart';

// import 'package:regain_mobile/features/screens/profile/profile_page.dart';
import 'package:regain_mobile/provider/address_data_provider.dart';

import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/category_data_provider.dart';
import 'package:regain_mobile/provider/commissions_provider.dart';
import 'package:regain_mobile/provider/favorites_data_provider.dart';
import 'package:regain_mobile/provider/forgot_password_provider.dart';
import 'package:regain_mobile/provider/green_zone_provider.dart';
import 'package:regain_mobile/provider/offers_data_provider.dart';
import 'package:regain_mobile/provider/order_provider.dart';
import 'package:regain_mobile/provider/product_data_provider.dart';
import 'package:regain_mobile/provider/rating_provider.dart';
import 'package:regain_mobile/routes/route_manager.dart';
import 'package:regain_mobile/themes/theme.dart';

import 'datasource/app_data_source.dart';
import 'features/screens/chatfeatures/chat_service.dart';

void main() {
  runApp(
      // ChangeNotifierProvider(
      //   create: (context) => AppDataProvider(), child: MyApp())
      const MyApp());
}

// Hello World
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppDataProvider>(
            create: (context) => AppDataProvider()),
        ChangeNotifierProvider<CategoryDataProvider>(
            create: (context) => CategoryDataProvider()),
        ChangeNotifierProvider<AddressDataProvider>(
            create: (context) => AddressDataProvider()),
        ChangeNotifierProvider<ProductDataProvider>(
            create: (context) => ProductDataProvider()),
        ChangeNotifierProvider<FavoritesDataProvider>(
            create: (context) => FavoritesDataProvider()),
        ChangeNotifierProvider<OffersDataProvider>(
            create: (context) => OffersDataProvider()),
        ChangeNotifierProvider<GreenZoneProvider>(
            create: (context) => GreenZoneProvider()),
        ChangeNotifierProvider(create: (_) => ChatService()),
        ChangeNotifierProvider<OrderProvider>(
            create: (context) => OrderProvider()),
        ChangeNotifierProvider<ForgotPasswordProvider>(
            create: (context) => ForgotPasswordProvider()),
        ChangeNotifierProvider<RatingProvider>(
            create: (context) => RatingProvider()),
        ChangeNotifierProvider<CommissionsProvider>(
            create: (context) => CommissionsProvider()),
        Provider<AppDataSource>(
          create: (_) => AppDataSource(), // Add AppDataSource here
        ),
        ChangeNotifierProvider<NotificationService>(
          create: (_) => NotificationService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Regain',
        theme: AppTheme.lightTheme,
        // theme: ThemeData(
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        //   appBarTheme: AppBarTheme(color: Color(0xFF12CF8A)),
        // ),

        // will have an error if connected to db and goes to navmenu right away
        initialRoute: RouteManager.routeLogin,
        onGenerateRoute: RouteManager.generateRoute,
        // routes: {
        //   RouteManager.routeLogin: (context) => LoginScreen(),
        //   routeHomepage: (context) => HomepageScreen(),
        //   routeNavMenu: (context) => NavigationMenu(),
        //   routeRegistration: (context) => RegistrationScreen(),
        //   routeProfilePage: (context) => ProfilePage(),
        //   routeAdd: (context) => Add(),
        // },
      ),
    );
  }
}
