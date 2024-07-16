import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/features/screens/offer/checkout.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/offers_model.dart';
import 'package:regain_mobile/model/viewoffers_model.dart';
import 'package:regain_mobile/provider/offers_data_provider.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';
import 'package:regain_mobile/themes/elements/input%20fields/regain_textbox.dart';

import '../temp_view_product.dart'; //temporary viewProduct Class

class BuyerOfferTile extends StatefulWidget {
  final ViewOffersModel offer;
  final Function(int) onDelete;

  const BuyerOfferTile({
    Key? key,
    required this.offer,
    required this.onDelete,
  }) : super(key: key);

  @override
  _BuyerOfferTileState createState() => _BuyerOfferTileState();
}

class _BuyerOfferTileState extends State<BuyerOfferTile> {
  final _offerController = TextEditingController();
  late String _currentOffer;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _currentOffer = widget.offer.offerValue;
    // _offerController = TextEditingController(text: _currentOffer);
  }

  @override
  void dispose() {
    _offerController.dispose();
    super.dispose();
  }

  Future<void> _cancelOffer() async {
    try {
      await AppDataSource().deleteOffers(widget.offer.offerID!);
      widget.onDelete(widget.offer.offerID!);
      ReGainHelperFunctions.showSnackBar(context, 'Offer has been revoked');
    } catch (error) {
      print('Failed to delete offer: $error');
      ReGainHelperFunctions.showSnackBar(context, 'Failed to revoke offer');
    }
  }

  Future<void> _updateOffer() async {
    try {
      final updatedOffer = ViewOffersModel(
        offerID: widget.offer.offerID,
        productID: widget.offer.productID,
        buyerName: widget.offer.buyerName,
        offerValue: _offerController.text,
        isAccepted: widget.offer.isAccepted,
        sellerName: widget.offer.sellerName,
      );
      // Provider.of<OffersDataProvider>(context, listen: false)
      //     .updateOffers(widget.offer.offerID!, updatedOffer);
      //     .then((response){

      //     });

      // final response = await AppDataSource()
      //     .updateOffers(widget.offer.offerID!, updatedOffer);

      // Handle response as needed
      // print('Update offer response: $response');

      ReGainHelperFunctions.showSnackBar(context, 'Offer updated successfully');

      setState(() {
        _currentOffer = _offerController.text;
        _isExpanded = false;
        // Add additional logic when the offer is updated
      });
    } catch (error) {
      print('Failed to update offer: $error');
      ReGainHelperFunctions.showSnackBar(context, 'Failed to update offer');
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Row(
                          children: [
                            const Icon(CupertinoIcons.exclamationmark_triangle,
                                color: red),
                            const SizedBox(width: 8),
                            Text(
                              "Delete Offer",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        content: Text(
                          "Are you sure you want to cancel this offer?",
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
                              Navigator.pop(context);
                              _cancelOffer();
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
                  }, //Cancel Offer Logic
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
                      onPressed: _updateOffer,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Checkout()),
                  );
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
