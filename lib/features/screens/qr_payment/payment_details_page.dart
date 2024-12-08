import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/nav.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth > 600 ? 40 : 16;
    double iconSize = screenWidth > 600 ? 60 : 40;
    double fontSize = screenWidth > 600 ? 24 : 20;

    return Scaffold(
      appBar: buildAppBar(
        context,
        'QR Payment Details',
      ),
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
                        ReGainTexts.qrTitle2,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ReGainTexts.qrMsg2,
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
            const Text(
              'Reference Number:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter the Reference Number',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: green),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Amount Paid:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter the amount you paid',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: green),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              height: ReGainSizes.spaceBtwSections,
            ),
            RegainButtons(
              text: 'Confirm Payment',
              onPressed: () {
                //where to redirect
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigationMenu(),
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
