import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/features/screens/offer/offer_tile/buyer_offer_tile.dart';
import 'package:regain_mobile/features/screens/offer/seller_offerlist_page.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/model/offers_model.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/model/viewoffers_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/offers_data_provider.dart';
import 'package:regain_mobile/provider/product_data_provider.dart';

// import 'temp_view_product.dart'; //temporary viewProduct Class

class OfferListPage extends StatefulWidget {
  OfferListPage({super.key});

  @override
  _OfferListPageState createState() => _OfferListPageState();
}

class _OfferListPageState extends State<OfferListPage> {
  List<ViewOffersModel> buyerOffers = [];
  List<ViewProduct> sellerOffers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchOffers();
  }

  void fetchOffers() async {
    final buyerID = Provider.of<AppDataProvider>(context, listen: false).userId;
    try {
      buyerOffers =
          await Provider.of<OffersDataProvider>(context, listen: false)
              .getOffersByBuyerID(buyerID);
      sellerOffers =
          await Provider.of<ProductDataProvider>(context, listen: false)
              .getAllProductsByUserFave(buyerID);
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      print('Error fetching offers: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> deleteOffer(int offerID) async {
    try {
      await AppDataSource().deleteOffers(offerID);
      setState(() {
        buyerOffers.removeWhere((offer) => offer.offerID == offerID);
      });
    } catch (error) {
      print('Failed to delete offer: $error');
    }
  }

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
              Tab(text: 'As Buyer'),
              Tab(text: 'As Seller'),
            ],
          ),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : TabBarView(
                children: [
                  ListView.builder(
                    itemCount: buyerOffers.length,
                    itemBuilder: (context, index) {
                      final offer = buyerOffers[index];
                      return BuyerOfferTile(
                        offer: offer,
                        onDelete: deleteOffer,
                      );
                    },
                  ),
                  SellerOfferList(),
                ],
              ),
      ),
    );
  }
}
