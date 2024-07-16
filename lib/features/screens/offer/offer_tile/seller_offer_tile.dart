import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

import '../temp_view_product.dart';

class SellerOfferTile extends StatefulWidget {
  final ViewProduct product;
  final List<BuyerOffer> buyerOffers; // Now a list of BuyerOffer

  const SellerOfferTile(
      {super.key, required this.product, required this.buyerOffers});

  @override
  SellerOfferTileState createState() => SellerOfferTileState();
}

class SellerOfferTileState extends State<SellerOfferTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, 'Buyer offers'),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(22.0),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.product.productName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'PHP ${widget.product.price}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 25),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.buyerOffers.length,
                itemBuilder: (context, index) {
                  final buyerOffer = widget.buyerOffers[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Final offer: PHP ${buyerOffer.offerPrice}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'by @${buyerOffer.buyerUsername}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RegainButtons(
                            text: 'Decline',
                            onPressed: () {
                              // Add logic to decline the buyer offer and pass in the buyer side
                            },
                            type: ButtonType.filled,
                            size: ButtonSize.xxs,
                            txtSize: BtnTxtSize.medium,
                            customColor: red,
                          ),
                          const SizedBox(width: 18),
                          RegainButtons(
                            text: 'Accept',
                            onPressed: () {
                              // Add logic to accept the buyer offer and pass in the buyer side
                            },
                            type: ButtonType.filled,
                            size: ButtonSize.xs,
                            txtSize: BtnTxtSize.medium,
                          ),
                        ],
                      ),

                      //for divider spacing
                      const SizedBox(height: 8),
                      const Divider(thickness: 1.0),
                      const SizedBox(height: 8),
                    ],
                  );
                },
              ),
            ],
          ),
        )));
  }
}
