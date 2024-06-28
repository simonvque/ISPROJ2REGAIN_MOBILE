import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../themes/elements/button_styles.dart';
import '../offer/offerpopup.dart';

class SelectedItemScreen extends StatefulWidget {
  @override
  _SelectedItemScreenState createState() => _SelectedItemScreenState();
}

class _SelectedItemScreenState extends State<SelectedItemScreen> {
  // Declare variables for item details
  final String item = 'Plastic Straw';
  final String price = 'PHP 100';
  final String description =
      'Hello! I have 2 bags of plastic straws available at my home. They are mostly made of polypropylene. Is anyone interested? Already 2 years long now. It is essential to understand that these straws are durable and can be used for various purposes. They are eco-friendly and can be recycled. Please let me know if you are interested.';

  final String category = 'Plastic';
  final String weight = '1 kg';
  final String location = 'Pasig City';
  final bool isSellerDropOff = false;
  bool isFavorite = false;
  bool isDescriptionExpanded = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void toggleDescription() {
    setState(() {
      isDescriptionExpanded = !isDescriptionExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> reviewTags = ['Timeliness', 'Professional', 'Friendly'];

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ReGainImages.plastic,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        price,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: green),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: toggleDescription,
                        child: Text(
                          isDescriptionExpanded
                              ? description
                              : (description.length > 100
                              ? '${description.substring(0, 100)} Show More'
                              : description),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'More Details',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text('Type: '),
                                Text(category),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text('Net Weight: '),
                                Text(weight),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Row(
                              children: [
                                Icon(Icons.location_pin),
                                const SizedBox(width: 8),
                                Text(location),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Row(
                              children: [
                                Icon(
                                  isSellerDropOff ? Icons.check_circle : Icons.cancel,
                                  color: isSellerDropOff ? Colors.green : Colors.red,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text('Seller drop-off'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'About Seller',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/profile.png'), // Replace with actual profile image
                            radius: 24,
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '@isaejen_',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.yellow),
                                  const SizedBox(width: 4),
                                  Text('4.2 (6 Reviews)'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Reviews',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: reviewTags.map((tag) {
                          return Chip(
                            label: Text(tag),
                            backgroundColor: green,
                            labelStyle: TextStyle(color: white),
                            side: BorderSide.none,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: Icon(Icons.flag, color: Colors.white),
              onPressed: () {
                // Navigate to report page or perform action
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: toggleFavorite,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // -------------------- PLACE OFFER --------------------
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return OfferPricePopup(); // Display OfferPricePopup as a dialog
                    },
                  );

                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: green,
                ),
                child: const Text(
                  'Place Offer',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
