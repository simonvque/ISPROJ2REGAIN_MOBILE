import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/image_strings.dart';
import 'homepage/widgets/homepage_cards.dart';

void main() {
  runApp(FavoritesScreen());
}

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreen createState() => _FavoritesScreen();
}

class _FavoritesScreen extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   icon: const Icon(CupertinoIcons.arrow_left, color: Colors.white),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          title: const Text(
            'Favorites',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat-Bold',
            ),
          ),
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // grid view items
                    CardItems(
                      items: [
                        {
                          'imagePath': ReGainImages.onboardingImage3,
                          'title': 'Copper nail',
                          'location': 'Pasig City',
                          'price': 'PHP 450',
                          'sellerImagePath': null,
                          'seller': '@heyitscee',
                          'weight': '5 kg',
                          'category': 'Metal',
                          'isSellerDropOff': true,
                        },
                        {'isSellerDropOff': false, 'isFavorite': true},
                        {
                          'imagePath': ReGainImages.onboardingImage3,
                          'title': 'Copper nail',
                          'location': 'Pasig City',
                          'price': 'PHP 450',
                          'sellerImagePath': null,
                          'seller': '@heyitscee',
                          'weight': '5 kg',
                          'category': 'Metal',
                          'isSellerDropOff': true,
                          'isFavorite': true
                        },
                        {
                          'imagePath': ReGainImages.onboardingImage3,
                          'title': 'Copper nail',
                          'location': 'Pasig City',
                          'price': 'PHP 450',
                          'sellerImagePath': null,
                          'seller': '@heyitscee',
                          'weight': '5 kg',
                          'category': 'Metal',
                          'isSellerDropOff': false,
                          'isFavorite': true
                        },
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(color: Color(0xFF12CF8A)),
      ),
    );
  }
}
