import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/features/screens/filter.dart';
import 'package:regain_mobile/features/screens/green_zone/green_zone_page.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/product_data_provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
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
  String? _selectedCategory;
  List<ViewProduct> listAllProducts = [];
  TextEditingController _searchController = TextEditingController();
  List<ViewProduct> searchResults = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final productProvider =
        Provider.of<ProductDataProvider>(context, listen: false);
    await productProvider.getCategories();

    final userId = Provider.of<AppDataProvider>(context, listen: false).userId;
    final allProducts = await productProvider.getAllProductsByUserFave(userId);

    setState(() {
      listAllProducts = allProducts;
    });
  }

  Future<void> _performSearch(String query) async {
    final productProvider =
        Provider.of<ProductDataProvider>(context, listen: false);
    final userId = Provider.of<AppDataProvider>(context, listen: false).userId;

    if (query.isEmpty) {
      setState(() {
        searchResults.clear();
      });
    } else {
      final results = await productProvider.searchProducts(query, userId);
      setState(() {
        searchResults = results;
      });
    }
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
                  controller: _searchController,
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  fillColor: white,
                  focusedBorderColor: white,
                  onChanged: (value) {
                    _performSearch(value); // Trigger search on text change
                  },
                ),

                const SizedBox(height: ReGainSizes.spaceBtwItems),

                // Dropdown, filter icon, and profile picture
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Dynamic Dropdown
                    Expanded(
                      child: Consumer<ProductDataProvider>(
                        builder: (context, provider, child) {
                          if (provider.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(color: white),
                            );
                          }

                          if (provider.categories.isEmpty) {
                            return const Center(
                              child: Text(
                                'No categories available',
                                style: TextStyle(color: white),
                              ),
                            );
                          }

                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: ReGainSizes.md),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(
                                  ReGainSizes.cardRadiusXs),
                              border: Border.all(color: white),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: green,
                                iconEnabledColor: white,
                                isExpanded: true,
                                items: provider.categories.map((category) {
                                  return DropdownMenuItem<String>(
                                    value: category.categoryName,
                                    child: Text(
                                      category.categoryName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: white),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) async {
                                  setState(() {
                                    _selectedCategory = newValue!;
                                  });

                                  // Filter products by category
                                  final userId = Provider.of<AppDataProvider>(
                                          context,
                                          listen: false)
                                      .userId;
                                  await provider.getFilteredProductsByCategory(
                                      newValue!, userId);
                                },
                                value: _selectedCategory,
                                hint: Text(
                                  'Select Category',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: white),
                                ),
                              ),
                            ),
                          );
                        },
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

          // Display Products
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Carousel
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: ReGainSizes.sm),
                    child: GestureDetector(
                      onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GreenZonePage()),
                        );
                      },
                      child: const ReGainCarousel(
                        banners: [
                          ReGainImages.carousel1,
                          ReGainImages.carousel1,
                          ReGainImages.carousel1,
                          ReGainImages.carousel1
                        ],
                      ),
                    ),
                  ),

                  // Grid View Items
                  Consumer<ProductDataProvider>(
                    builder: (context, provider, child) {
                      final productsToDisplay = searchResults.isNotEmpty
                          ? searchResults
                          : _selectedCategory != null
                              ? provider.filteredProducts
                              : listAllProducts;

                      return CardItems(items: productsToDisplay);
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
