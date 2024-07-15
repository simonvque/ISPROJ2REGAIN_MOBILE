import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/offer/offer_tile/buyer_offer_tile.dart';
import 'package:regain_mobile/features/screens/offer/seller_offerlist_page.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';

import 'temp_view_product.dart'; //temporary viewProduct Class 

class OfferListPage extends StatelessWidget {
  OfferListPage({super.key});

//Temporary ViewProduct class is at the very end of this file;
  final List<ViewProduct> sampleProducts = [
    ViewProduct(
      productID: 1,
      productName: 'Product 1',
      location: 'Location 1',
      price: '100.0', //OFFER DEFAULT VALUE FROM BUYER
      sellerUsername: 'Seller1',
      weight: '1kg',
      category: 'Category1',
      canDeliver: true,
      isFavorite: false,
      offerStatus: 'Pending', //  field for offer status
    ),
    ViewProduct(
      productID: 2,
      productName: 'Product 2',
      location: 'Location 2',
      price: '200.0',
      sellerUsername: 'Seller2',
      weight: '2kg',
      category: 'Category2',
      canDeliver: false,
      isFavorite: true,
      offerStatus: 'Accepted', // field for offer status
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(
          context,
          'My Offers',
          tabBar: TabBar(
            unselectedLabelColor: white,
            indicatorWeight: 4.0,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            tabs: const [
              Tab(
                text: 'As Buyer',
              ),
              Tab(text: 'As Seller'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: sampleProducts.length,
              itemBuilder: (context, index) {
                final product = sampleProducts[index];
                return BuyerOfferTile(product: product); //a separated widget; tile for the list
              },
            ),
           
            SellerOfferList() // seller side
          ]
            ),
        ),
      );
  }
}

