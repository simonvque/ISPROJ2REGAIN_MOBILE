import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/model/favorite_model.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/favorites_data_provider.dart';
import 'package:regain_mobile/routes/route_manager.dart';

import 'package:regain_mobile/features/screens/report_features/report_page.dart';

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
  bool? isFavorite;
  bool isDescriptionExpanded = false;

  final dataSource = AppDataSource();
  late String ipAddress = dataSource.ipAddPort;
  Uint8List? sellerProfileImage;

  @override
  void initState() {
    // TODO: implement initState
    isFavorite = widget.item.isFavorite;
    _fetchSellerProfileImage(widget.item.sellerUsername);
    super.initState();
  }

  Future<void> _fetchSellerProfileImage(String username) async {
    final dataSource = AppDataSource();
    final profileImage = await dataSource.getSellerProfileImage(username);

    setState(() {
      sellerProfileImage = profileImage;
    });
  }

  // updates selected item if user favorites card from homepage
  @override
  void didUpdateWidget(oldwidget) {
    super.didUpdateWidget(oldwidget);
    // TODO: implement initState
    if (widget.item.isFavorite != oldwidget.item.isFavorite) {
      isFavorite = widget.item.isFavorite;
    }
  }

  // void toggleFavorite() {
  //   setState(() {
  //     isFavorite = !isFavorite!;
  //   });
  // }

  void toggleDescription() {
    setState(() {
      isDescriptionExpanded = !isDescriptionExpanded;
    });
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   Navigator.pushReplacementNamed(context, RouteManager.routeHomepage);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final List<String> reviewTags = ['Timeliness', 'Professional', 'Friendly'];

    final user = Provider.of<AppDataProvider>(context, listen: false).user;

    // Decode the base64 image string from the item
    Uint8List? decodedImage;
    if (widget.item.image != null && widget.item.image!.isNotEmpty) {
      try {
        decodedImage = base64Decode(widget.item.image!);
      } catch (e) {
        debugPrint('Error decoding image: $e');
        decodedImage = null;
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: decodedImage != null
                      ? Image.memory(
                          decodedImage,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          ReGainImages.onboardingImage3,
                          fit: BoxFit.cover,
                        ),
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
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: sellerProfileImage != null
                                ? MemoryImage(sellerProfileImage!)
                                : const AssetImage(ReGainImages.exProfilePic)
                                    as ImageProvider,
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
//////////////////////// REPORTS PAGE
//////////////////////// REPORTS PAGE
          Positioned(
            top: 16,
            right: 16,
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.flag, color: Colors.white),
              onSelected: (String reportType) async {
                final appDataProvider =
                    Provider.of<AppDataProvider>(context, listen: false);
                final reporterID = appDataProvider.userId;

                if (reporterID == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You must be logged in to report an item.'),
                    ),
                  );
                  return;
                }

                if (reportType == 'product') {
                  // Navigate to the ReportPage for reporting a product
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReportPage(
                        reportType: 'product', // Pass reportType as 'product'
                        productName: widget.item.productName,
                        sellerUsername: widget.item.sellerUsername,
                        productCategory: widget.item.category,
                        productPrice: widget.item.price.toString(),
                        reporterID: reporterID,
                        reportedListingID: widget.item.productID, // Product ID
                      ),
                    ),
                  );
                } else if (reportType == 'user') {
                  final sellerUsername = widget.item.sellerUsername;

                  try {
                    // Fetch seller ID dynamically using the seller's username
                    final sellerId = await _fetchSellerIdByUsername(
                        sellerUsername, ipAddress);

                    // Navigate to the ReportPage for reporting a user
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ReportPage(
                          reportType: 'user', // Pass reportType as 'user'
                          productName: '',
                          sellerUsername: sellerUsername,
                          productCategory: '',
                          productPrice: '',
                          reporterID: reporterID,
                          reportedListingID:
                              sellerId, // Seller's User ID fetched dynamically
                        ),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to fetch seller ID: $e')),
                    );
                  }
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'product',
                  child: Text('Report Product'),
                ),
                const PopupMenuItem<String>(
                  value: 'user',
                  child: Text('Report User'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                isFavorite! ? Icons.favorite : Icons.favorite_border,
                color: isFavorite! ? Colors.red : null,
              ),
              onPressed: addFavorite,
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
                    final sellerId = await _fetchSellerIdByUsername(
                        sellerUsername, ipAddress);

                    // Check if chat room exists between the current user and the seller
                    final chatRoomId = await _fetchOrCreateChatRoom(
                        currentUserId, sellerId, ipAddress);

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
                              .user!
                              .username;
                      return OfferPricePopup(
                        sellerUsername: widget.item.sellerUsername,
                        defaultOfferPrice: widget.item.price,
                        prod: widget.item,
                        buyerName: username,
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

  addFavorite() async {
    if (widget.item.isFavorite == false) {
      final fave = FavoriteModel(
          userID: Provider.of<AppDataProvider>(context, listen: false).userId,
          productID: widget.item.productID);
      await Provider.of<FavoritesDataProvider>(context, listen: false)
          .addFavorite(fave)
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          setState(() {
            widget.item.isFavorite = true;
            isFavorite = !isFavorite!;
          });
        }
      });
    } else {
      final userDeleting =
          Provider.of<AppDataProvider>(context, listen: false).userId;
      final toDelete = widget.item.productID;
      await Provider.of<FavoritesDataProvider>(context, listen: false)
          .deleteFavorite(userDeleting, toDelete)
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          setState(() {
            widget.item.isFavorite = false;
            isFavorite = !isFavorite!;
          });
        }
      });
    }
  }
}

Future<String> _fetchOrCreateChatRoom(
    int userId1, int userId2, String ipAdd) async {
  // Try to get existing chat room
  final chatRoomId = await _getExistingChatRoom(userId1, userId2, ipAdd);

  if (chatRoomId != null) {
    return chatRoomId;
  }

  // If no existing room, create a new one
  final newChatRoomId = await _createNewChatRoom(userId1, userId2, ipAdd);
  return newChatRoomId;
}

Future<String?> _getExistingChatRoom(
    int userId1, int userId2, String ipAdd) async {
  final url = Uri.parse(
      'http://$ipAdd/api/chat/room/$userId1-$userId2'); // Adjust API URL accordingly

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final roomData = jsonDecode(response.body);
    return roomData['roomId']; // Return roomId if room exists
  } else {
    return null; // No room exists
  }
}

Future<String> _createNewChatRoom(
    int userId1, int userId2, String ipAdd) async {
  final url = Uri.parse(
      'http://$ipAdd/api/chat/createRoom?userId1=$userId1&userId2=$userId2');

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

Future<int> _fetchSellerIdByUsername(String username, String ipAdd) async {
  final url = Uri.parse(
      'http://$ipAdd/api/user/seller/by-username/$username'); // Adjusted URL

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
