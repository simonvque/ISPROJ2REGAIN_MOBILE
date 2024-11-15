import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:http/http.dart' as http;
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../chatfeatures/chat.dart';
import '../offer/offerpopup.dart';
// import '../offer/temp_view_product.dart';

class SelectedItemScreen extends StatefulWidget {
  final ViewProduct item;
  SelectedItemScreen({super.key, required this.item});

  @override
  _SelectedItemScreenState createState() => _SelectedItemScreenState();
}

class _SelectedItemScreenState extends State<SelectedItemScreen> {
  // Declare variables for item details
  // final String item = 'Plastic Straw';
  // final String price = 'PHP 100';
  // final String description =
  //     'Hello! I have 2 bags of plastic straws available at my home. They are mostly made of polypropylene. Is anyone interested? Already 2 years long now. It is essential to understand that these straws are durable and can be used for various purposes. They are eco-friendly and can be recycled. Please let me know if you are interested.';

  // final String category = 'Plastic';
  // final String weight = '1 kg';
  // final String location = 'Pasig City';
  // final bool isSellerDropOff = false;
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
                        // item,
                        '${widget.item.productName}',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        // price,
                        'PHP ${widget.item.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: green),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: toggleDescription,
                        child: Text(
                          isDescriptionExpanded
                              ? widget.item.description
                              : (widget.item.description.length > 100
                                  ? '${widget.item.description.substring(0, 100)} Show More'
                                  : widget.item.description),
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
                                const Text('Type: '),
                                Text(widget.item.category),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4.0),
                            child: Row(
                              children: [
                                SizedBox(width: 8),
                                Text('Net Weight: '),
                                Text('${widget.item.weight} kg'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Row(
                              children: [
                                const Icon(Icons.location_pin),
                                const SizedBox(width: 8),
                                Text(widget.item.location),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Row(
                              children: [
                                Icon(
                                  widget.item.canDeliver
                                      ? Icons.check_circle
                                      : Icons.cancel,
                                  color: widget.item.canDeliver
                                      ? Colors.green
                                      : Colors.red,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text('Seller drop-off'),
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
                          const CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/profile/profileSam.jpg'), // Replace with actual profile image
                            radius: 24,
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '@${widget.item.sellerUsername}',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const Row(
                                children: [
                                  Icon(Icons.star, color: Colors.yellow),
                                  SizedBox(width: 4),
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
                            labelStyle: const TextStyle(color: white),
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
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.flag, color: Colors.white),
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
            IconButton(
                icon: Icon(
                  Icons.message,
                  color: black,
                ),
                onPressed: () async {
                  final appDataProvider =
                      Provider.of<AppDataProvider>(context, listen: false);
                  final currentUserId =
                      appDataProvider.userId; // Get the current user ID
                  final sellerUsername =
                      widget.item.sellerUsername; // Get the seller's username

                  if (currentUserId == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              "You must be logged in to message a seller.")),
                    );
                    return;
                  }

                  try {
                    // Fetch seller ID dynamically
                    final sellerId =
                        await _fetchSellerIdByUsername(sellerUsername);

                    // Check if chat room exists between the current user and the seller
                    final chatRoomId =
                        await _fetchOrCreateChatRoom(currentUserId, sellerId);

                    // Navigate to the ChatScreen
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        roomId: chatRoomId,
                        userId: currentUserId.toString(),
                      ),
                    ));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Failed to initiate chat: $e")),
                    );
                  }
                }),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // -------------------- PLACE OFFER --------------------
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      final username =
                          Provider.of<AppDataProvider>(context, listen: false)
                              .user
                              ?.username;
                      return OfferPricePopup(
                        sellerUsername: widget.item.sellerUsername,
                        defaultOfferPrice: widget.item.price,
                        productID: widget.item.productID,
                        buyerName: username!,
                      ); // Display OfferPricePopup as a dialog
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

Future<String> _fetchOrCreateChatRoom(int userId1, int userId2) async {
  // Try to get existing chat room
  final chatRoomId = await _getExistingChatRoom(userId1, userId2);

  if (chatRoomId != null) {
    return chatRoomId;
  }

  // If no existing room, create a new one
  final newChatRoomId = await _createNewChatRoom(userId1, userId2);
  return newChatRoomId;
}

Future<String?> _getExistingChatRoom(int userId1, int userId2) async {
  final url = Uri.parse(
      'http://10.18.12.239:9191/api/chat/room/$userId1-$userId2'); // Adjust API URL accordingly

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final roomData = jsonDecode(response.body);
    return roomData['roomId']; // Return roomId if room exists
  } else {
    return null; // No room exists
  }
}

Future<String> _createNewChatRoom(int userId1, int userId2) async {
  final url = Uri.parse(
      'http://10.18.12.239:9191/api/chat/createRoom?userId1=$userId1&userId2=$userId2');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'userId1': userId1,
      'userId2': userId2,
    }),
  );
  print('Request Body: ${jsonEncode({
        'userId1': userId1,
        'userId2': userId2,
      })}');

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final roomData = jsonDecode(response.body);
    return roomData['roomId']; // Return the new room ID
  } else {
    throw Exception('Failed to create chat room');
  }
}

Future<int> _fetchSellerIdByUsername(String username) async {
  final url = Uri.parse(
      'http://10.18.12.239:9191/api/user/seller/by-username/$username'); // Adjusted URL

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final sellerData = jsonDecode(response.body);
    print(sellerData); // Log the entire response body

    if (sellerData != null && sellerData.containsKey('response')) {
      return sellerData[
          'response']; // Ensure 'response' key exists and is not null
    } else {
      throw Exception('Seller ID not found in response');
    }
  } else {
    print('Error: ${response.statusCode}');
    print('Response Body: ${response.body}');
    throw Exception('Failed to fetch seller ID');
  }
}
