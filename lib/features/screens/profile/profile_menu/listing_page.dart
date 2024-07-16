import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/listings/add_product.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/edit_listing_page.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/category.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/nav.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/category_data_provider.dart';
import 'package:regain_mobile/provider/product_data_provider.dart';

class ListingPage extends StatefulWidget {
  ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  List<Product> sampleProducts = [];

  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    // *UNCOMMENT* WHEN CONNECTING TO DB
    final userID = Provider.of<AppDataProvider>(context, listen: false).userId;
    final prodList =
        await Provider.of<ProductDataProvider>(context, listen: false)
            .getProductsByUser(userID);
    Provider.of<CategoryDataProvider>(context, listen: false).getCategories();

    sampleProducts = prodList;

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
      appBar: buildAppBar(context, 'My Listings', actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddProduct()));
            },
            icon: const Icon(
              Icons.add,
              color: white,
            )),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavigationMenu()));
            },
            icon: const Icon(
              Icons.home,
              color: white,
            )),
      ]),
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

class OptionsBottomSheet extends StatefulWidget {
  // final ViewProduct product;
  final Product product;

  const OptionsBottomSheet({super.key, required this.product});

  @override
  State<OptionsBottomSheet> createState() => _OptionsBottomSheetState();
}

class _OptionsBottomSheetState extends State<OptionsBottomSheet> {
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
                  builder: (context) =>
                      EditListingPage(product: widget.product),
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
                        // delete function here <<<<<<<<<<<<<
                        deleteProduct();

                        // Navigator.pop(context);
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

  void deleteProduct() {
    Provider.of<ProductDataProvider>(context, listen: false)
        .deleteProduct(widget.product.productID!)
        .then((response) {
      if (response.responseStatus == ResponseStatus.SAVED) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NavigationMenu()));
        ReGainHelperFunctions.showSnackBar(
            context, "Product deleted successfully");
      }
    });
  }
}
