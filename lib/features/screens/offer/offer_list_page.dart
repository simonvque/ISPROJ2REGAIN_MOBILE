import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';
import 'package:regain_mobile/themes/elements/input%20fields/regain_textbox.dart';

class OfferListPage extends StatelessWidget {
  OfferListPage({super.key});

//Temporary ViewProduct class is at the very end of this file;
  final List<ViewProduct> sampleProducts = [
    ViewProduct(
      productID: 1,
      productName: 'Product 1',
      location: 'Location 1',
      price: '100.0', //OFFER DEFAULT VALUE
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
                return ProductOfferTile(product: product);
              },
            ),
            ListView.builder(
              itemCount: sampleProducts.length,
              itemBuilder: (context, index) {
                final product = sampleProducts[index];
                return ProductOfferTile(product: product);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductOfferTile extends StatefulWidget {
  final ViewProduct product;

  const ProductOfferTile({super.key, required this.product});

  @override
  ProductOfferTileState createState() => ProductOfferTileState();
}

class ProductOfferTileState extends State<ProductOfferTile> {
  bool _isExpanded = false;
  final TextEditingController _offerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _offerController.text = widget.product.price;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
          border: const Border(bottom: BorderSide(color: gray, width: 1.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Status: ${widget.product.offerStatus}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            '${widget.product.productName} - PHP ${widget.product.price}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            widget.product.sellerUsername,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 16),
          Text(
            'My Offer: PHP ${widget.product.price}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          const SizedBox(height: 22),

          //conditional for offer status
          if (!_isExpanded && widget.product.offerStatus == 'Pending')
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RegainButtons(
                  text: 'Update Offer',
                  onPressed: () {
                    setState(() {
                      _isExpanded = true;
                    });
                  },
                  type: ButtonType.text,
                  size: ButtonSize.small,
                  txtSize: BtnTxtSize.medium,
                ),
                RegainButtons(
                  text: 'Cancel Offer',
                  onPressed: () {
                    // Add logic to cancel the offer
                  },
                  type: ButtonType.text,
                  size: ButtonSize.small,
                  txtSize: BtnTxtSize.medium,
                ),
              ],
            ),
          if (_isExpanded)
            Column(
              children: [
                RegainTextbox(
                  controller: _offerController,
                  keyboardType: TextInputType.number,
                  labelText: "Enter your new offer:",
                  focusedBorderColor: green,
                  isUnderlineBorder: true,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    RegainButtons(
                      text: 'Cancel',
                      onPressed: () {
                        setState(() {
                          _isExpanded = false;
                        });
                      },
                      type: ButtonType.text,
                      size: ButtonSize.small,
                      txtSize: BtnTxtSize.medium,
                    ),
                    const SizedBox(width: 6),
                    RegainButtons(
                      text: 'Save offer',
                      onPressed: () {
                        setState(() {
                          widget.product.price = _offerController.text;
                          _isExpanded = false;
                          // Add additional logic when the offer is updated
                        });
                      },
                      type: ButtonType.filled,
                      size: ButtonSize.small,
                      txtSize: BtnTxtSize.medium,
                    ),
                  ],
                ),
              ],
            ),
          if (widget.product.offerStatus == 'Accepted')
            Align(
              alignment: Alignment.center,
              child: RegainButtons(
                text: 'Proceed to Checkout',
                onPressed: () {
                  // Add logic to proceed to checkout
                },
                type: ButtonType.filled,
                size: ButtonSize.medium,
                txtSize: BtnTxtSize.large,
              ),
            )
        ],
      ),
    );
  }
}

class ViewProduct {
  int productID;
  String productName;
  String location;
  String price;
  String sellerUsername;
  String weight;
  String category;
  bool canDeliver;
  bool isFavorite;
  String offerStatus;

  ViewProduct({
    required this.productID,
    required this.productName,
    required this.location,
    required this.price,
    required this.sellerUsername,
    required this.weight,
    required this.category,
    required this.canDeliver,
    required this.isFavorite,
    required this.offerStatus,
  });
}
