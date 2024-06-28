import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:regain_mobile/features/screens/filter.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../../../themes/elements/input fields/regain_textbox.dart';
import '../homepage/widgets/homepage_cards.dart';
import '../homepage/widgets/homepage_carousel.dart';
import '../profile/profile_page.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomepageScreen> {
  String _selectedValue = 'Recyclables'; // Initial value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Green container background
          Container(
            color: green,
            padding: const EdgeInsets.all(ReGainSizes.spaceBtwItems),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search bar
                // SizedBox(
                //   width: double.infinity,
                //   child: Container(
                //     padding: const EdgeInsets.all(ReGainSizes.md),
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(ReGainSizes.cardRadiusXs),
                //     ),
                //     child: Row(
                //       children: [
                //         const Icon(Icons.search, color: Colors.grey),
                //         const SizedBox(height: ReGainSizes.spaceBtwItems / 2),
                //         Text("Search", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                //       ],
                //     ),
                //   ),
                // ),

                const SizedBox(height: ReGainSizes.spaceBtwItems),

                const RegainTextbox(hintText: 'Search', prefixIcon: Icon(Icons.search), fillColor: white, fontColor: black, focusedBorderColor: white),

                const SizedBox(height: ReGainSizes.spaceBtwItems),

                // Dropdown, filter icon, and profile picture
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Dropdown menu
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: ReGainSizes.md),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(ReGainSizes.cardRadiusXs),
                          border: Border.all(color: white),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: green,
                            iconEnabledColor: white,
                            isExpanded: true,
                            items: <String>['Recyclables', 'Equipments'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedValue = newValue!;
                              });
                            },
                            value: _selectedValue,
                          ),
                        ),
                      ),
                    ),

                    // Filter icon
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: ReGainSizes.md),
                      child: IconButton(
                        icon: const Icon(Icons.filter_list, color: Colors.white),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => FilterScreen()));
                        },
                      ),
                    ),

                    // Profile picture
                    InkWell(
                      onTap: () {
                        //----------------------------- GO TO PROFILE PAGE -----------------------------
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          const CircleAvatar(
                            backgroundImage: NetworkImage('https://lh4.googleusercontent.com/proxy/diAq9zObVXZOBQ-35PuawibY4uFDrnmQUd18A7cvh_e661B0Y4HFLCyVmCZE8DmsExSSrAaaTazBZ92XxJuIjT-tBBbpdXWJ3OVM1TRbmzg3u8z4KKcTg3VZLtRJ8LIdvg'),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'My Profile',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  // carousel
                  Padding(
                    padding: EdgeInsets.all(ReGainSizes.sm),
                    child: ReGainCarousel(banners: [ReGainImages.carousel1,ReGainImages.carousel1,ReGainImages.carousel1,ReGainImages.carousel1],),
                  ),

                  // grid view items
                  CardItems(
                    items: [
                      {
                        'imagePath': ReGainImages.onboardingImage1,
                        'title': 'Copper nail',
                        'location': 'Pasig City',
                        'price': 'PHP 450',
                        'sellerImagePath': null,
                        'seller': '@heyitscee',
                        'weight': '5 kg',
                        'category': 'Metal',
                        'isSellerDropOff': true,
                        'isFavorite': false
                      },{
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
                      },{
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
    );
  }

}