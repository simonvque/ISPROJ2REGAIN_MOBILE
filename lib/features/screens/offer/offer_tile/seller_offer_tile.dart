import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/model/viewoffers_model.dart';
import 'package:regain_mobile/provider/offers_data_provider.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

// import '../temp_view_product.dart';

class SellerOfferTile extends StatefulWidget {
  final ViewProduct product;
  final List<ViewOffersModel> sellerOffers;

  // final List<BuyerOffer> buyerOffers; // Now a list of BuyerOffer

  const SellerOfferTile({
    super.key,
    required this.product,
    required this.sellerOffers,
    // required this.buyerOffers,
  });

  @override
  SellerOfferTileState createState() => SellerOfferTileState();
}

class SellerOfferTileState extends State<SellerOfferTile> {
  // final _sellerUpdateOfferKey = GlobalKey<FormState>();
  bool? _toAccept;
  bool _disableButtons = false;

  // @override
  // void didUpdateWidget(covariant SellerOfferTile oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);

  //   if (widget.sellerOffers != oldWidget.sellerOffers) {
  //     setState(() {widget.sellerOffers = });
  //   }
  // }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    setState(() {});
    super.didChangeDependencies();
  }

  void _updateOffer(ViewOffersModel buyerOffer, bool sellerAccept) {
    final updatedOffer = ViewOffersModel(
      offerID: buyerOffer.offerID,
      product: buyerOffer.product,
      buyerName: buyerOffer.buyerName,
      offerValue: buyerOffer.offerValue,
      isAccepted: sellerAccept,
      sellerName: buyerOffer.sellerName,
    );
    Provider.of<OffersDataProvider>(context, listen: false)
        .updateOffers(buyerOffer.offerID!, updatedOffer)
        .then((response) {
      if (response.responseStatus == ResponseStatus.SAVED) {
        setState(() {
          _toAccept = sellerAccept;
        });

        ReGainHelperFunctions.showSnackBar(context, response.message);
      }
    });
  }

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
                itemCount: widget.sellerOffers.length,
                itemBuilder: (context, index) {
                  final buyerOffer = widget.sellerOffers[index];

                  _toAccept = buyerOffer.isAccepted;
                  if (_toAccept != null && _toAccept == true) {
                    _disableButtons == true;
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Final offer: PHP ${buyerOffer.offerValue}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'by @${buyerOffer.buyerName}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      if (_toAccept == null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RegainButtons(
                              text: 'Decline',
                              onPressed: () {
                                // Add logic to decline the buyer offer and pass in the buyer side
                                _updateOffer(buyerOffer, false);
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
                                _updateOffer(buyerOffer, true);
                              },
                              type: ButtonType.filled,
                              size: ButtonSize.xs,
                              txtSize: BtnTxtSize.medium,
                            ),
                          ],
                        )
                      else if (_toAccept != null && _toAccept == true)
                        const Text('ACCEPTED')
                      else if (_toAccept != null && _toAccept == false)
                        const Text('DECLINED'),

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
