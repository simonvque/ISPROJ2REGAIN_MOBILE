// import 'package:flutter/material.dart';
// import 'package:regain_mobile/themes/elements/button_styles.dart';
// import 'package:regain_mobile/themes/elements/input%20fields/regain_textbox.dart';

// import '../../../constants/sizes.dart';

// class OfferPricePopup extends StatelessWidget {
//   const OfferPricePopup({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       child: SingleChildScrollView(
//         child: contentBox(context),
//       ),
//     );
//   }

//   contentBox(context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       constraints:
//           const BoxConstraints(maxWidth: 400), // Adjust maxWidth as needed
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Row(
//             children: [
//               const CircleAvatar(
//                 backgroundImage:
//                     AssetImage('assets/images/profile/profileSam.jpg'),
//                 radius: 20,
//               ),
//               const SizedBox(height: ReGainSizes.spaceBtwItems / 2),
//               Expanded(
//                 child: Text('@sammysalami is selling this for PHP 100',
//                     style: Theme.of(context).textTheme.labelLarge),
//               ),
//             ],
//           ),
//           const Divider(height: 20, color: Colors.grey),
//           const SizedBox(width: ReGainSizes.spaceBtwItems),
//           Text('Enter offer value:',
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.titleLarge),
//           const SizedBox(height: ReGainSizes.spaceBtwItems / 2),
//           RegainTextbox(
//               hintText: 'Type your offer here',
//               isUnderlineBorder: true,
//               keyboardType: TextInputType.phone),
//           const SizedBox(height: ReGainSizes.defaultSpace),
//           RegainButtons(
//             text: 'Place Offer',
//             onPressed: () {
//               // Add your confirmation logic here
//             },
//             type: ButtonType.filled,
//             size: ButtonSize.large,
//             txtSize: BtnTxtSize.large,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
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

  const OfferPricePopup({
    super.key,
    required this.sellerUsername,
    required this.defaultOfferPrice,
    required this.prod,
    required this.buyerName,
  });

  @override
  State<OfferPricePopup> createState() => _OfferPricePopupState();
}

class _OfferPricePopupState extends State<OfferPricePopup> {
  final _placeOfferKey = GlobalKey<FormState>();

  final TextEditingController _offerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _offerController.text = widget.defaultOfferPrice.toString();
  }

  // Future<void> _addOffer() async {
  //   try {
  //     final newOffer = ViewOffersModel(
  //       productID: widget.productID,
  //       buyerName: widget.buyerName,
  //       offerValue: _offerController.text,
  //       isAccepted: false,
  //       sellerName: widget.sellerUsername,
  //     );

  //     await Provider.of<OffersDataProvider>(context, listen: false)
  //         .addOffers(newOffer);

  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) =>
  //               NavigationMenu()), // Replace with your home page
  //       (route) => false,
  //     );

  //     Future.delayed(Duration.zero, () {
  //       ReGainHelperFunctions.showSnackBar(context, "Offer has been placed");
  //     });
  //   } catch (error) {
  //     print('Failed to add offer: $error');
  //   }
  // }

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
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/profile/profileSam.jpg'),
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
