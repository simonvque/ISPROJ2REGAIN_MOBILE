import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/listings/user_products.dart';

class UserProductsScreen extends StatefulWidget {
  const UserProductsScreen({super.key});

  @override
  State<UserProductsScreen> createState() => _UserProductsScreenState();
}

class _UserProductsScreenState extends State<UserProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(color: green),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: green,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.arrow_left, color: white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'My Product Listings',
            style: TextStyle(
              color: white,
              fontFamily: 'Montserrat-Bold',
            ),
          ),
        ),
        body: const SingleChildScrollView(
            child: Column(
          children: [
            UserProducts(
              products: [],
            )
          ],
        )),
      ),
    );
  }
}
