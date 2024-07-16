import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/model/offers_model.dart';
import 'package:regain_mobile/model/viewoffers_model.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';
import 'package:regain_mobile/themes/elements/input%20fields/regain_textbox.dart';

import '../temp_view_product.dart'; //temporary viewProduct Class

class BuyerOfferTile extends StatefulWidget {
  final ViewOffersModel offer;
  final Function onDelete;

  const BuyerOfferTile({
    super.key,
    required this.offer,
    required this.onDelete,
  });

  @override
  BuyerOfferTileState createState() => BuyerOfferTileState();
}

class BuyerOfferTileState extends State<BuyerOfferTile> {
  bool _isExpanded = false;
  final TextEditingController _offerController = TextEditingController();
  late String _currentOffer;

  @override
  void initState() {
    super.initState();
    _currentOffer = widget.offer.offerValue;
    _offerController.text = _currentOffer;
  }

  Future<void> _cancelOffer() async {
    try {
      await AppDataSource().deleteOffers(widget.offer.offerID!);
      widget.onDelete(widget.offer.offerID);
    } catch (error) {
      print('Failed to delete offer: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(bottom: BorderSide(color: gray, width: 1.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '@${widget.offer.sellerName}',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.55),
              Text(
                widget.offer.isAccepted ? 'Accepted' : 'Pending',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            widget.offer.buyerName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 2),
          Text(
            'PHP ${widget.offer.offerValue}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 22),
          Align(
            alignment: Alignment.center,
            child: Text(
              'My Offer: PHP $_currentOffer',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 22),
          if (!_isExpanded && !widget.offer.isAccepted)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RegainButtons(
                  text: 'Cancel Offer',
                  onPressed: _cancelOffer, //Cancel Offer Logic
                  type: ButtonType.filled,
                  size: ButtonSize.xxs,
                  txtSize: BtnTxtSize.medium,
                  customColor: red,
                ),
                const SizedBox(width: 20),
                RegainButtons(
                  text: 'Update Offer',
                  onPressed: () {
                    setState(() {
                      _isExpanded = true;
                    });
                  },
                  type: ButtonType.filled,
                  size: ButtonSize.xs,
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    const SizedBox(width: 2),
                    RegainButtons(
                      text: 'Save offer',
                      onPressed: () {
                        //Update Offer Logic
                        setState(() {
                          _currentOffer = _offerController.text;
                          _isExpanded = false;
                          // Add additional logic when the offer is updated
                        });
                      },
                      type: ButtonType.filled,
                      size: ButtonSize.xs,
                      txtSize: BtnTxtSize.medium,
                    ),
                  ],
                ),
              ],
            ),
          if (widget.offer.isAccepted)
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
            ),
        ],
      ),
    );
  }
}
