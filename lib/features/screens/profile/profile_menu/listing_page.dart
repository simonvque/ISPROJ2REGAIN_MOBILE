import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/edit_listing_page.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/product_data_provider.dart';

class ListingPage extends StatefulWidget {
  ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  List<ViewProduct> sampleProducts = [];

  void initState() {
    super.initState();
  }

  void _getData() {
    // *UNCOMMENT* WHEN CONNECTING TO DB
    final userID = Provider.of<AppDataProvider>(context, listen: false).userId;
    Provider.of<ProductDataProvider>(context, listen: false)
        .getProductsByUser(userID);

    // *COMMENT OUT* WHEN CONNECTING TO DB
    // sampleProducts = [
    //   ViewProduct(
    //     productID: 1,
    //     productName: 'Product 1',
    //     location: 'Location 1',
    //     price: '100.0',
    //     sellerUsername: 'Seller1',
    //     weight: '1kg',
    //     category: 'Category1',
    //     canDeliver: true,
    //     isFavorite: false,
    //   ),
    //   ViewProduct(
    //     productID: 2,
    //     productName: 'Product 2',
    //     location: 'Location 2',
    //     price: '200.0',
    //     sellerUsername: 'Seller2',
    //     weight: '2kg',
    //     category: 'Category2',
    //     canDeliver: false,
    //     isFavorite: true,
    //   ),
    // ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'My Listings'),
      body: Consumer<ProductDataProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.userProducts.length,
            itemBuilder: (context, index) {
              final product = value.userProducts[index];
              return ListTile(
                title: Text(
                  product.productName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(
                  'PHP ${product.price} - ${product.location}',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                trailing: const Icon(CupertinoIcons.ellipsis_vertical),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => OptionsBottomSheet(product: product),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class OptionsBottomSheet extends StatelessWidget {
  final ViewProduct product;

  const OptionsBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(CupertinoIcons.square_pencil_fill),
            title: Text(
              ReGainTexts.btnEdit,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditListingPage(product: product),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.delete_solid,
              color: red,
            ),
            title: Text(
              ReGainTexts.btnDelete,
              style:
                  Theme.of(context).textTheme.titleLarge?.copyWith(color: red),
            ),
            onTap: () {
              // confirmation dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Row(
                    children: [
                      const Icon(CupertinoIcons.exclamationmark_triangle,
                          color: red),
                      const SizedBox(width: 8),
                      Text(
                        ReGainTexts.alertDelete,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  content: Text(
                    ReGainTexts.alertDelMsg,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                      },
                      child: Text(
                        ReGainTexts.btnCancel,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // delete function here
                        Navigator.pop(context);
                      },
                      child: Text(
                        ReGainTexts.btnDelete,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: red),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
