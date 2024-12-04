import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/features/screens/awareness/awareness.dart';
import 'package:regain_mobile/features/screens/chatfeatures/chat.dart';
import 'package:regain_mobile/features/screens/chatfeatures/room_list.dart';
import 'package:regain_mobile/features/screens/filter.dart';
import 'package:regain_mobile/features/screens/green_zone/green_zone_page.dart';
import 'package:regain_mobile/features/screens/homepage/widgets/homepage_cards_twice.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/product_data_provider.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../themes/elements/input fields/regain_textbox.dart';
import '../chatfeatures/chat_service.dart';
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

  List<ViewProduct> listAllProducts = [];

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    // *UNCOMMENT* WHEN CONNECTING TO DB
    final user = Provider.of<AppDataProvider>(context, listen: false).userId;
    final allProducts =
        await Provider.of<ProductDataProvider>(context, listen: false)
            .getAllProductsByUserFave(user);

    listAllProducts = allProducts;

    // *COMMENT OUT* WHEN CONNECTING TO DB
    // listAllProducts = [
    //   ViewProduct(
    //       productID: 1,
    //       productName: 'Copper nail',
    //       location: 'Manila',
    //       price: 'PHP 450',
    //       sellerUsername: '@heyitscee',
    //       weight: '5 kg',
    //       category: 'Metal',
    //       canDeliver: true,
    //       isFavorite: false),
    //   ViewProduct(
    //       productID: 2,
    //       productName: 'Tin cans',
    //       location: 'Quezon City',
    //       price: '300.00',
    //       sellerUsername: 'secondUser',
    //       weight: '200.00',
    //       category: 'Metals',
    //       canDeliver: false,
    //       isFavorite: true),
    // ];
  }

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
                const SizedBox(height: ReGainSizes.spaceBtwItems),

                // Search bar
                RegainTextbox(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    fillColor: white,
                    focusedBorderColor: white),

                const SizedBox(height: ReGainSizes.spaceBtwItems),

                // Dropdown, filter icon, and profile picture
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Dropdown menu
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: ReGainSizes.md),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.circular(ReGainSizes.cardRadiusXs),
                          border: Border.all(color: white),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: green,
                            iconEnabledColor: white,
                            isExpanded: true,
                            items: <String>['Recyclables', 'Equipments']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: white),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: ReGainSizes.md),
                      child: IconButton(
                        icon: const Icon(Icons.filter_list, color: white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FilterScreen()),
                          );
                        },
                      ),
                    ),

                    // Profile picture
                    InkWell(
                      onTap: () {
                        // ----------------------------- GO TO PROFILE PAGE -----------------------------
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://lh4.googleusercontent.com/proxy/diAq9zObVXZOBQ-35PuawibY4uFDrnmQUd18A7cvh_e661B0Y4HFLCyVmCZE8DmsExSSrAaaTazBZ92XxJuIjT-tBBbpdXWJ3OVM1TRbmzg3u8z4KKcTg3VZLtRJ8LIdvg'),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'My Profile',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
// Invitation Banner
Padding(
  padding: const EdgeInsets.only(bottom: 8.0), 
  child: Container(
    padding: const EdgeInsets.all(24.0),
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: gray, 
          width: 0.5,              
        ),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Invitation Title
            Text(
              "Discover the Green Zone",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: green,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),

            // Short Message
            Text(
              "Explore curated resources and news updates about our environment.",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16.0),

            // Image logos of the websites
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 48.0,
                  width: 48.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/homepage/denr.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Container(
                  height: 48.0,
                  width: 48.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/homepage/pna.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Call to Action Button
            RegainButtons(
              text: "Visit Green Zone",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GreenZonePage(),
                  ),
                );
              },
              type: ButtonType.filled,
              txtSize: BtnTxtSize.medium,
              size: ButtonSize.xs,
            ),
          ],
        ),
      ),
    ),

                  // grid view items
                  Consumer<ProductDataProvider>(
                    builder: (context, provider, child) {
                      return CardItems(

                          // *UNCOMMENT* WHEN CONNECTING TO DB
                          // items: provider.allProducts

                          // *COMMENT OUT* WHEN CONNECTING TO DB
                          items: listAllProducts

                          // items: [
                          //   {
                          //     'imagePath': ReGainImages.onboardingImage3,
                          //     'title': 'Copper nail',
                          //     'location': 'Pasig City',
                          //     'price': 'PHP 450',
                          //     'sellerImagePath': null,
                          //     'seller': '@heyitscee',
                          //     'weight': '5 kg',
                          //     'category': 'Metal',
                          //     'isSellerDropOff': true,
                          //     'isFavorite': false
                          //   },
                          //   {
                          //     'imagePath': ReGainImages.onboardingImage3,
                          //     'title': 'Copper nail',
                          //     'location': 'Pasig City',
                          //     'price': 'PHP 450',
                          //     'sellerImagePath': null,
                          //     'seller': '@heyitscee',
                          //     'weight': '5 kg',
                          //     'category': 'Metal',
                          //     'isSellerDropOff': true,
                          //     'isFavorite': true
                          //   },
                          //   {
                          //     'imagePath': ReGainImages.onboardingImage3,
                          //     'title': 'Copper nail',
                          //     'location': 'Pasig City',
                          //     'price': 'PHP 450',
                          //     'sellerImagePath': null,
                          //     'seller': '@heyitscee',
                          //     'weight': '5 kg',
                          //     'category': 'Metal',
                          //     'isSellerDropOff': true,
                          //     'isFavorite': true
                          //   },
                          //   {
                          //     'imagePath': ReGainImages.onboardingImage3,
                          //     'title': 'Copper nail',
                          //     'location': 'Pasig City',
                          //     'price': 'PHP 450',
                          //     'sellerImagePath': null,
                          //     'seller': '@heyitscee',
                          //     'weight': '5 kg',
                          //     'category': 'Metal',
                          //     'isSellerDropOff': true,
                          //     'isFavorite': true
                          //   },
                          //   {
                          //     'imagePath': ReGainImages.onboardingImage3,
                          //     'title': 'Copper nail',
                          //     'location': 'Pasig City',
                          //     'price': 'PHP 450',
                          //     'sellerImagePath': null,
                          //     'seller': '@heyitscee',
                          //     'weight': '5 kg',
                          //     'category': 'Metal',
                          //     'isSellerDropOff': false,
                          //     'isFavorite': true
                          //   },
                          //   {
                          //     'imagePath': ReGainImages.onboardingImage3,
                          //     'title': 'Copper nail',
                          //     'location': 'Pasig City',
                          //     'price': 'PHP 450',
                          //     'sellerImagePath': null,
                          //     'seller': '@heyitscee',
                          //     'weight': '5 kg',
                          //     'category': 'Metal',
                          //     'isSellerDropOff': false,
                          //     'isFavorite': true
                          //   },
                          // ],
                          );
                    },
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
