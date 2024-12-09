import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/model/viewoffers_model.dart';
import 'package:regain_mobile/nav.dart';
import 'package:regain_mobile/provider/offers_data_provider.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';
import 'package:regain_mobile/themes/elements/input%20fields/regain_textbox.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class OfferPricePopup extends StatefulWidget {
  final String sellerUsername;
  final String defaultOfferPrice;
  final ViewProduct prod;
  final String buyerName;
  final AppDataSource dataSource;
  const OfferPricePopup({
    super.key,
    required this.sellerUsername,
    required this.defaultOfferPrice,
    required this.prod,
    required this.buyerName,
    required this.dataSource,
  });

  @override
  State<OfferPricePopup> createState() => _OfferPricePopupState();
}

class _OfferPricePopupState extends State<OfferPricePopup> {
  final _placeOfferKey = GlobalKey<FormState>();

  final TextEditingController _offerController = TextEditingController();
  Uint8List? sellerProfileImage;
  @override
  void initState() {
    super.initState();
    _fetchSellerProfileImage();
    _offerController.text = widget.defaultOfferPrice.toString();
  }

  Future<void> _fetchSellerProfileImage() async {
    try {
      final profileImage =
          await widget.dataSource.getSellerProfileImage(widget.sellerUsername);
      setState(() {
        sellerProfileImage = profileImage;
      });
    } catch (e) {
      debugPrint('Error fetching seller profile image: $e');
      sellerProfileImage = null;
    }
  }

  void _addOffer() {
    if (_placeOfferKey.currentState!.validate()) {
      final newOffer = ViewOffersModel(
        product: widget.prod,
        buyerName: widget.buyerName,
        offerValue: _offerController.text,
        sellerName: widget.sellerUsername,
      );
      Provider.of<OffersDataProvider>(context, listen: false)
          .addOffers(newOffer)
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          resetFields();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NavigationMenu()), // Replace with your home page
            (route) => false,
          );
          ReGainHelperFunctions.showSnackBar(context, "Offer has been placed");
        }
      });
    }
  }

  bool validateDecimalInput(String input) {
    String pattern = r'^(?=\D*(?:\d\D*){1,12}$)\d+(?:\.\d{1,2})?$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(input);
  }

  void resetFields() {
    _offerController.clear();
  }

  @override
  void dispose() {
    _offerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? errorTxt;
    return Form(
      key: _placeOfferKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //drag button element
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(top: 6.0, bottom: 8.0),
                width: 40.0,
                height: 6.5,
                decoration: BoxDecoration(
                  color: gray,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: sellerProfileImage != null
                      ? MemoryImage(sellerProfileImage!)
                      : const AssetImage('assets/images/profile/profileSam.jpg')
                          as ImageProvider,
                  radius: 20,
                ),
                const SizedBox(width: ReGainSizes.spaceBtwItems / 2),
                Expanded(
                  child: Text(
                    '@${widget.sellerUsername} is selling this for PHP ${widget.defaultOfferPrice}',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
            const Divider(height: 20, color: Colors.grey),
            const SizedBox(height: ReGainSizes.spaceBtwItems),
            Text(
              'Enter offer value:',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: ReGainSizes.spaceBtwItems / 2),
            RegainTextbox(
              controller: _offerController,
              hintText: 'PHP ${widget.defaultOfferPrice}',
              isUnderlineBorder: true,
              keyboardType: TextInputType.number,
              fillColor: Colors.transparent,
              fontColor: gray,
              errorText: errorTxt,
              validator: (value) {
                String error = "Please enter a valid offer";
                if (value == null ||
                    value.isEmpty ||
                    validateDecimalInput(value) == false) {
                  return error;
                } else if (double.parse(value) < 0.0) {
                  return error;
                }
                return null;
              },
            ),
            const SizedBox(height: ReGainSizes.defaultSpace),
            RegainButtons(
              text: 'Place Offer',
              onPressed: _addOffer,
              type: ButtonType.filled,
              size: ButtonSize.large,
              txtSize: BtnTxtSize.large,
            ),
          ],
        ),
      ),
    );
  }
}
