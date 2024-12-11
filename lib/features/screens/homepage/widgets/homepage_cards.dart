import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/constants/image_strings.dart';
import 'package:regain_mobile/model/favorite_model.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/favorites_data_provider.dart';

import '../selected_item.dart';

class CardItems extends StatelessWidget {
  List<ViewProduct> items;
  final VoidCallback onRefresh;
  //Product product;

  CardItems({
    required this.items,
    // this.imagePath,
    required this.onRefresh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height * 0.7),
      ),
      itemBuilder: (context, index) {
        //final Map<String, dynamic> item = items[index];
        final ViewProduct item = items[index];
        return CardItem(
          item: item,
          onRefresh: onRefresh,
        );
      },
    );
  }
}

class CardItem extends StatefulWidget {
  final ViewProduct item;
  final dynamic sellerImage;
  final VoidCallback onRefresh;

  const CardItem({
    required this.item,
    this.sellerImage,
    required this.onRefresh,
    super.key,
  });

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  late bool isFavorite;
  // bool _isRunning = false;

  List<ViewProduct> productItems = [];

  @override
  void initState() {
    // TODO: implement initState
    isFavorite = widget.item.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isSellerDropOff = widget.item.canDeliver;

    // Decode Base64 image if available
    Uint8List? imageBytes;
    if (widget.item.image != null && widget.item.image!.isNotEmpty) {
      try {
        imageBytes = base64Decode(widget.item.image!);
      } catch (e) {
        debugPrint('Error decoding Base64 image: $e');
      }
    }

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SelectedItemScreen(
                      item: widget.item,
                    )),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Dynamic Image Section
            SizedBox(
              width: double.infinity,
              height: 100,
              child: imageBytes != null
                  ? Image.memory(
                      imageBytes,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      ReGainImages.onboardingImage3,
                      fit: BoxFit.cover,
                    ),
            ),
            // Remaining card content
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.item.productName,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      widget.item.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.item.isFavorite ? Colors.red : Colors.black,
                    ),
                    onPressed: () => addFavorite(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.item.location,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'PHP ${widget.item.price}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: widget.sellerImage != null
                            ? ClipOval(
                                child: Image.asset(
                                  ReGainImages.exProfilePic,
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 16,
                              ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '@${widget.item.sellerUsername}',
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${widget.item.weight} kg',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        isSellerDropOff ? Icons.check_circle : Icons.cancel,
                        color: isSellerDropOff ? Colors.green : Colors.red,
                        size: 24,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'Seller drop-off',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // addFavorite() async {
  //   if (widget.item.isFavorite == false) {
  //     final fave = FavoriteModel(
  //         userID: Provider.of<AppDataProvider>(context, listen: false).userId,
  //         productID: widget.item.productID!);
  //     await Provider.of<FavoritesDataProvider>(context, listen: false)
  //         .addFavorite(fave)
  //         .then((response) {
  //       if (response.responseStatus == ResponseStatus.SAVED) {
  //         setState(() {
  //           widget.item.isFavorite = true;
  //           isFavorite = !isFavorite;
  //         });
  //       }
  //     });
  //   } else {
  //     final userDeleting =
  //         Provider.of<AppDataProvider>(context, listen: false).userId;
  //     final toDelete = widget.item.productID;
  //     await Provider.of<FavoritesDataProvider>(context, listen: false)
  //         .deleteFavorite(userDeleting, toDelete!)
  //         .then((response) {
  //       if (response.responseStatus == ResponseStatus.SAVED) {
  //         setState(() {
  //           widget.item.isFavorite = false;
  //           isFavorite = false;
  //         });
  //         widget.onRefresh(); // Refresh the favorites list
  //       }
  //     });
  //   }
  // }

  addFavorite() async {
    final userId = Provider.of<AppDataProvider>(context, listen: false).userId;
    final productId = widget.item.productID!;

    if (!widget.item.isFavorite) {
      final fave = FavoriteModel(userID: userId, productID: productId);
      await Provider.of<FavoritesDataProvider>(context, listen: false)
          .addFavorite(fave)
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          setState(() {
            widget.item.isFavorite = true;
          });
        }
      });
    } else {
      await Provider.of<FavoritesDataProvider>(context, listen: false)
          .deleteFavorite(userId, productId)
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          setState(() {
            widget.item.isFavorite = false;
          });
          widget.onRefresh(); // Refresh the favorites list
        }
      });
    }
  }
}
