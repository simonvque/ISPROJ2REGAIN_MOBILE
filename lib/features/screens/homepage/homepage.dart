import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/features/screens/chatfeatures/notificationservice.dart';
import 'package:regain_mobile/features/screens/filter.dart';
import 'package:regain_mobile/features/screens/green_zone/green_zone_page.dart';
import 'package:regain_mobile/features/screens/green_zone/green_zone_page.dart';
import 'package:regain_mobile/features/screens/homepage/widgets/greenzone_inv_card.dart';
import 'package:regain_mobile/features/screens/homepage/widgets/homepage_cards_twice.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/product_data_provider.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../themes/elements/input fields/regain_textbox.dart';
import '../chatfeatures/notifivation_list_screen.dart';
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
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    final userId = Provider.of<AppDataProvider>(context, listen: false).userId;
    if (userId != null) {
      await Provider.of<NotificationService>(context, listen: false)
          .fetchUnreadNotifications(userId);
    }
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
    void _openNotifications() {
      final userId =
          Provider.of<AppDataProvider>(context, listen: false).userId;

      if (userId != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationListScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User not logged in.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }

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

                          // Add "All" to categories for showing all products
                          final categoriesWithAll = [
                            'All',
                            ...provider.categories
                                .map((category) => category.categoryName)
                          ];

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
                                items: categoriesWithAll.map((category) {
                                  return DropdownMenuItem<String>(
                                    value: category,
                                    child: Text(
                                      category,
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

                                  final userId = Provider.of<AppDataProvider>(
                                          context,
                                          listen: false)
                                      .userId;

                                  if (newValue == 'All') {
                                    // Reset to all products
                                    final allProducts = await provider
                                        .getAllProductsByUserFave(userId);
                                    setState(() {
                                      listAllProducts = allProducts;
                                    });
                                  } else {
                                    // Filter products by category
                                    await provider
                                        .getFilteredProductsByCategory(
                                            newValue!, userId);
                                  }
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

                    // Bell icon with notification badge
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: ReGainSizes.md),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.notifications, color: white),
                            onPressed: () {
                              _openNotifications();
                            },
                          ),
                          Consumer<NotificationService>(
                            builder: (context, notificationService, child) {
                              if (notificationService.unreadCount > 0) {
                                return Positioned(
                                  right: 6,
                                  top: 6,
                                  child: Container(
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(color: white, width: 1.5),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      notificationService.unreadCount > 99
                                          ? '99+'
                                          : '${notificationService.unreadCount}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                // Do not show the badge if no notifications exist
                                return const SizedBox.shrink();
                              }
                            },
                          ),
                        ],
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
                          Consumer<AppDataProvider>(
                            builder: (context, appDataProvider, child) {
                              final user = appDataProvider.user;

                              return CircleAvatar(
                                radius: 20,
                                backgroundImage: (user?.profileImage != null &&
                                        user!.profileImage!.isNotEmpty)
                                    ? MemoryImage(user.profileImage!)
                                    : const AssetImage(
                                            ReGainImages.exProfilePic)
                                        as ImageProvider<Object>,
                              );
                            },
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

          //Invitation Cards
          const GreenzoneInvCard(),

          // Display Products
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Grid View Items
                  Consumer<ProductDataProvider>(
                    builder: (context, provider, child) {
                      final productsToDisplay = searchResults.isNotEmpty
                          ? searchResults
                          : _selectedCategory != null &&
                                  _selectedCategory != 'All'
                              ? provider.filteredProducts
                              : listAllProducts;

                      return CardItems(
                        items: productsToDisplay,
                        onRefresh:
                            () {}, // Provide an empty callback or a meaningful one if needed
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
