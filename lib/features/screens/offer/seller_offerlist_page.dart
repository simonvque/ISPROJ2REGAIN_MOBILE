import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/offer/offer_tile/seller_offer_tile.dart';
import 'temp_view_product.dart';

class SellerOfferList extends StatelessWidget {
  SellerOfferList({super.key});

  final List<ViewProduct> sellerProducts = [
    ViewProduct(
      productID: 1,
      productName: 'My Product 1', //seller's product name
      location: 'Location 1',
      price: '150.0', //seller's initial price
      sellerUsername: 'Seller1',
      weight: '1.5kg',
      category: 'Category1',
      canDeliver: true,
      isFavorite: false,
      offerStatus: 'Pending',
    ),
    ViewProduct(
      productID: 2,
      productName: 'My Product 2', //seller's product name
      location: 'Location 2',
      price: '250.0', //seller's initial price
      sellerUsername: 'Seller2',
      weight: '2.5kg',
      category: 'Category2',
      canDeliver: false,
      isFavorite: true,
      offerStatus: 'Accepted',
    ),
  ];

  final Map<int, List<BuyerOffer>> buyerOffers = {
    //product id 1
    1: [
      BuyerOffer(
          buyerUsername: 'Buyer1', offerPrice: '140.0', offerStatus: 'Pending'),
      BuyerOffer(
          buyerUsername: 'Buyer2', offerPrice: '150.0', offerStatus: 'Pending'),
      BuyerOffer(
          buyerUsername: 'Buyer1', offerPrice: '140.0', offerStatus: 'Pending'),
      BuyerOffer(
          buyerUsername: 'Buyer2', offerPrice: '150.0', offerStatus: 'Pending'),
      BuyerOffer(
          buyerUsername: 'Buyer1', offerPrice: '140.0', offerStatus: 'Pending'),
      BuyerOffer(
          buyerUsername: 'Buyer2', offerPrice: '150.0', offerStatus: 'Pending'),
      BuyerOffer(
          buyerUsername: 'Buyer1', offerPrice: '140.0', offerStatus: 'Pending'),
    ],
    //product id 2
    2: [
      BuyerOffer(
          buyerUsername: 'Buyer3', offerPrice: '240.0', offerStatus: 'Pending'),
      BuyerOffer(
          buyerUsername: 'Buyer4', offerPrice: '250.0', offerStatus: 'Pending'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: sellerProducts.length,
            itemBuilder: (context, index) {
              final product = sellerProducts[index];
              return ListTile(
                  title: Text(
                    product.productName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    'PHP ${product.price}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  trailing: const Icon(CupertinoIcons.chevron_forward),
                  onTap: () {
                    // Get the product ID from the keys of buyerOffers map
                    int productId = buyerOffers.keys.toList()[index];

                    // Get the seller product corresponding to the current productId
                    ViewProduct product = sellerProducts.firstWhere(
                        (product) => product.productID == productId);

                    // Get the list of buyer offers for the current productId
                    List<BuyerOffer> buyerOffersList =
                        buyerOffers[productId] ?? [];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SellerOfferTile(
                            product: product,
                            buyerOffers: buyerOffersList,
                          ),
                        ));
                  });
            }));
  }
}
