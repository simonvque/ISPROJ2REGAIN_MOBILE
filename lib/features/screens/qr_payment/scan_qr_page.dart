import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/image_strings.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/features/screens/qr_payment/payment_details_page.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class ScanQRPage extends StatelessWidget {
  const ScanQRPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth > 600 ? 40 : 16;
    double iconSize = screenWidth > 600 ? 60 : 40;
    double fontSize = screenWidth > 600 ? 24 : 20;

    return Scaffold(
      appBar: buildAppBar(context, 'QR Payment', onBackPressed: null ),
      body: SingleChildScrollView(  
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Icon(
                  Icons.qr_code_scanner_rounded,
                  size: iconSize,
                  color: green,
                ),
                const SizedBox(width: 10),
                Expanded( 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Scan to Pay',
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Scan the QR code to complete your payment',
                        style: TextStyle(
                          fontSize: fontSize - 4,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: ReGainSizes.spaceBtwSections,
            ),

            SizedBox(
              width: screenWidth * 1, 
              height: screenWidth * 1, 
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding), 
                child: Image.asset(
                  ReGainImages.regainQR,
                  fit: BoxFit.contain,
                ),
              ),
            ), 
            
            const SizedBox(
              height: ReGainSizes.spaceBtwSections,
            ),

            RegainButtons(
              text: ReGainTexts.next,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentDetailsPage(),
                  ),
                );
              },
              type: ButtonType.filled,
              txtSize: BtnTxtSize.large,
              size: ButtonSize.large,
            ),
          ],
        ),
      ),
    );
  }
}
