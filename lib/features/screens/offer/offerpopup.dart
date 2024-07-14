import 'package:flutter/material.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';
import 'package:regain_mobile/themes/elements/input%20fields/regain_textbox.dart';

import '../../../constants/sizes.dart';

class OfferPricePopup extends StatelessWidget {
  const OfferPricePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(maxWidth: 400), // Adjust maxWidth as needed
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/profile/profileSam.jpg'), // Replace with your image asset
                radius: 20,
              ),
              const SizedBox(height: ReGainSizes.spaceBtwItems / 2),
              Expanded(
                child: Text('@sammysalami is selling this for PHP 100',
                    style: Theme.of(context).textTheme.labelLarge),
              ),
            ],
          ),
          const Divider(height: 20, color: Colors.grey),
          const SizedBox(width: ReGainSizes.spaceBtwItems),
          Text('Enter offer value:',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: ReGainSizes.spaceBtwItems / 2),
          RegainTextbox(
              hintText: 'Type your offer here',
              isUnderlineBorder: true,
              keyboardType: TextInputType.phone),
          // TextField(
          //   decoration: InputDecoration(
          //     hintText: 'Type your offer here',
          //     hintStyle: TextStyle(
          //         fontFamily:
          //             'Montserrat-Regular', // Change the font family here
          //         fontSize: 16,
          //         color: Colors.black),
          //     focusedBorder: UnderlineInputBorder(
          //       borderSide: BorderSide(color: Colors.green),
          //     ),
          //   ),
          // ),
          const SizedBox(height: ReGainSizes.defaultSpace),

          RegainButtons(
            text: 'Place Offer',
            onPressed: () {
              // Add your confirmation logic here
            },
            type: ButtonType.filled,
            size: ButtonSize.large,
          ),

          // ElevatedButton(
          //   onPressed: () {
          //     // Add your confirmation logic here
          //   },
          //   style: ElevatedButton.styleFrom(
          //     foregroundColor: Colors.white,
          //     backgroundColor: Color(0xFF12CF8A),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(8.0),
          //     ),
          //     minimumSize: Size(double.infinity, 50),
          //   ),
          //   child: const Padding(
          //     padding: EdgeInsets.all(16.0),
          //     child: Text(
          //       'Place Offer',
          //       style:
          //           TextStyle(fontSize: 12, fontFamily: 'Montserrat-ExtraBold'),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
