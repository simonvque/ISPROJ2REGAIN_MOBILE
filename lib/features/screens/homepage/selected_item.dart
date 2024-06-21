import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../../../themes/elements/button_styles.dart';
import '../offer/offerpopup.dart';

// class SelectedItemScreen extends StatelessWidget {
//   const SelectedItemScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> reviewTags = ['Timeliness', 'Professional', 'Friendly'];
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(
//                   ReGainImages.plastic,
//                   height: 200,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//                 const SizedBox(height: 16),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Plastic Straw',
//                         style: Theme.of(context).textTheme.headlineLarge,
//                       ),
//                       Text(
//                         'PHP 100',
//                         style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: green),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'Hello! I have 2 bags of plastic straws available at my home. They are mostly made of polypropylene. Is anyone interested? Already 2 years long now.',
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'More Details',
//                         style: Theme.of(context).textTheme.headlineSmall,
//                       ),
//                       const SizedBox(height: 8),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 8.0),
//                             child: Row(
//                               children: [
//                                 const SizedBox(width: 8),
//                                 Text('Plastic'),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 4.0),
//                             child: Row(
//                               children: [
//                                 const SizedBox(width: 8),
//                                 Text('1 kg'),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 4.0),
//                             child: Row(
//                               children: [
//                                 Icon(Icons.location_pin),
//                                 const SizedBox(width: 8),
//                                 Text('Pasig City'),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 4.0),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.check_circle,
//                                   color: green,
//                                   size: 20,
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Text('Seller drop-off'),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'About Seller',
//                         style: Theme.of(context).textTheme.headlineSmall,
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundImage: AssetImage('assets/profile.png'),
//                             radius: 24,
//                           ),
//                           const SizedBox(width: 16),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '@isaejen_',
//                                 style: Theme.of(context).textTheme.titleLarge,
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(Icons.star, color: Colors.yellow),
//                                   const SizedBox(width: 4),
//                                   Text('4.2 (6 Reviews)'),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       // Add reviews section here
//                       Text(
//                         'Reviews',
//                         style: Theme.of(context).textTheme.headlineMedium,
//                       ),
//                       const SizedBox(height: 8),
//                       Wrap(
//                         spacing: 8,
//                         children: reviewTags.map((tag) {
//                           return Chip(
//                             label: Text(tag),
//                             backgroundColor: green,
//                             labelStyle: TextStyle(color: white),
//                             side: BorderSide.none,
//                           );
//                         }).toList(),
//                       ),
//                       const SizedBox(height: 16),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: 16,
//             left: 16,
//             child: IconButton(
//               icon: Icon(Icons.arrow_back, color: Colors.white),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//           Positioned(
//             top: 16,
//             right: 16,
//             child: IconButton(
//               icon: Icon(Icons.flag, color: Colors.white),
//               onPressed: () {
//                 // ---------------- GO TO REPORT PAGE ----------------
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           children: [
//             IconButton(
//               icon: Icon(Icons.favorite_border),
//               onPressed: () {
//                 // -------------------- SAVE TO FAVORITES --------------------
//               },
//             ),
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // -------------------- PLACE OFFER --------------------
//                 },
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   foregroundColor: Colors.white,
//                   backgroundColor: green,
//                 ),
//                 child: const Text(
//                   'Place Offer',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SelectedItemScreen extends StatelessWidget {
  // Declare variables for item details
  final String item = 'Plastic Straw';
  final String price = 'PHP 100';
  final String description =
      'Hello! I have 2 bags of plastic straws available at my home. They are mostly made of polypropylene. Is anyone interested? Already 2 years long now.';
  final String category = 'Plastic';
  final String weight = '1 kg';
  final String location = 'Pasig City';
  final bool isSellerDropOff = false;

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
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium,
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
                                Text(category),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
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
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                // Save to favorites functionality
              },
            ),
            Expanded(
              child: RegainButtons(
                text: 'Place Offer',
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return OfferPricePopup(); // Display OfferPricePopup as a dialog
                    },
                  );
                },
                type: ButtonType.filled,
                size: ButtonSize.small,
              ),

            ),
          ],
        ),
      ),
    );
  }
}

