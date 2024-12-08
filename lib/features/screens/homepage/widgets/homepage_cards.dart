import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/constants/image_strings.dart';
import 'package:regain_mobile/model/favorite_model.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/favorites_data_provider.dart';
import 'package:regain_mobile/provider/product_data_provider.dart';

import '../selected_item.dart';

class CardItems extends StatelessWidget {
  List<ViewProduct> items;
  //Product product;

  CardItems({
    required this.items,
    // this.imagePath,

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
        return CardItem(item: item);
      },
    );
  }
}

class CardItem extends StatefulWidget {
  //final Map<String, dynamic> item;
  final ViewProduct item;
  final dynamic sellerImage;

  //final imagePath;

  // final productID;
  // final productName;
  // final location;
  // final price;
  // final sellerUsername;
  // final weight;
  // final category;
  // final isSellerDropOff;
  // final isFavorite;

  const CardItem({
    required this.item,
    this.sellerImage,
    //required this.imagePath,
    // required this.productID,
    // required this.productName,
    // required this.location,
    // required this.price,
    // required this.sellerUsername,
    // required this.weight,
    // required this.category,
    // required this.isSellerDropOff,
    // required this.isFavorite,
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

  // @override
  // void didUpdateWidget(oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (widget.item.isFavorite != oldWidget.item.isFavorite) {
  //     isFavorite = widget.item.isFavorite;
  //   }
  // }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   isFavorite = widget.item.isFavorite;
  // }

  // void _onPressed() async {
  //   setState(() {
  //     _isRunning = true;
  //   });

  //   await this.OnButtonPressed();

  //   setState(() {
  //     _isRunning = false;
  //   });
  // }

  // _getData() async {
  //   //Provider.of<AppDataProvider>(context, listen: false).setUser(1);
  //   //final userId = Provider.of<AppDataProvider>(context, listen: false).userId;
  //   final allProducts =
  //       await Provider.of<ProductDataProvider>(context, listen: false)
  //           .getAllProductsByUserFave(1);

  //   productItems = allProducts;
  // }

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
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.black,
                    ),
                    onPressed: () => addFavorite(),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     widget.item.category,
            //     style: const TextStyle(
            //       fontSize: 8.0,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
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
            isFavorite = !isFavorite;
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
            isFavorite = !isFavorite;
          });
        }
      });
    }
  }

  // void deleteFavorite() {
  //   if (widget.item.isFavorite == true) {

  //   }
  // }
}
