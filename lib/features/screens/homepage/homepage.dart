import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/homepage/widgets/homepage_cards.dart';
import 'package:regain_mobile/features/screens/homepage/widgets/homepage_carousel.dart';
import 'package:regain_mobile/profile/profile_page.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130.0),

        // SEARCH
        child: AppBar(
          backgroundColor: green,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: white,
                    ),
                  ),
                ),

                // CATEGORY | FILTER | PROFILE
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.white),
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
                                  style: const TextStyle(color: white),
                                ),
                              );
                            }).toList(),
                            onChanged: (_) {},
                            value: 'Recyclables',
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_list, color: white),
                      onPressed: () {},
                    ),
                    InkWell(
                      onTap: () {
                        // ----------------------------- GO TO PROFILE PAGE -----------------------------
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      },
                      child: const Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage('https://lh4.googleusercontent.com/proxy/diAq9zObVXZOBQ-35PuawibY4uFDrnmQUd18A7cvh_e661B0Y4HFLCyVmCZE8DmsExSSrAaaTazBZ92XxJuIjT-tBBbpdXWJ3OVM1TRbmzg3u8z4KKcTg3VZLtRJ8LIdvg'),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'My Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      // body: const SingleChildScrollView(
      //   child: Padding(
      //     padding: EdgeInsets.all(ReGainSizes.sm),
      //     child: ReGainCarousel(banners: [ReGainImages.carousel1,ReGainImages.carousel1,ReGainImages.carousel1,ReGainImages.carousel1],),
      //   )
      // )

      // body: const CardItems(
      //   items: [
      //     {
      //       'imagePath': ReGainImages.onboardingImage3,
      //       'title': 'Copper nail',
      //       'location': 'Pasig City',
      //       'price': 'PHP 450',
      //       'sellerImagePath': null,
      //       'seller': '@heyitscee',
      //       'weight': '5 kg',
      //       'category': 'Metal',
      //       'isSellerDropOff': true,
      //     },
      //     {
      //       'imagePath': ReGainImages.plastic,
      //       'title': 'Plastic Straw',
      //       'location': 'Pasay City',
      //       'price': 'PHP 100',
      //       'sellerImagePath': null,
      //       'seller': '@isaejen_',
      //       'weight': '3 kg',
      //       'category': 'Plastic',
      //       'isSellerDropOff': false,
      //     },
      //   ],
      // ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(ReGainSizes.defaultSpace),
              child: Column(
                children: [
                  ReGainCarousel(banners: [ReGainImages.carousel1,ReGainImages.carousel1,ReGainImages.carousel1,ReGainImages.carousel1]),
                ],
              ),
            ),
          ],
        ),
      ),


    );
  }
}


