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
import 'package:regain_mobile/features/screens/offer/checkout.dart';
import 'package:regain_mobile/features/screens/offer/checkout.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';
import 'package:regain_mobile/themes/elements/input%20fields/regain_textbox.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class OfferPricePopup extends StatelessWidget {
  final String sellerUsername;
  final String defaultOfferPrice;

  const OfferPricePopup({
    super.key,
    required this.sellerUsername,
    required this.defaultOfferPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  '@$sellerUsername is selling this for PHP $defaultOfferPrice',
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
            hintText: 'PHP $defaultOfferPrice',
            isUnderlineBorder: true,
            keyboardType: TextInputType.phone,
            fillColor: Colors.transparent,
            fontColor: gray,
          ),
          const SizedBox(height: ReGainSizes.defaultSpace),
          RegainButtons(
            text: 'Place Offer',
            onPressed: () {
              // Add your confirmation logic here
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Checkout()));
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Checkout()));
            },
            type: ButtonType.filled,
            size: ButtonSize.large,
            txtSize: BtnTxtSize.large,
          ),
        ],
      ),
    );
  }
}
