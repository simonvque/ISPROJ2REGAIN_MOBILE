import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/profile/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class CommissionPage extends StatelessWidget {
  const CommissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Commission balance'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyleTxt('Your total balance:'), // to constant text
                    SizedBox(height: ReGainSizes.spaceBtwItems / 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StyleBalTxt('PHP 14.00'),
                        SizedBox(width: ReGainSizes.spaceBtwItems / 4),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: StyleTxt('/50.00',
                              color: Colors.grey), // to constant
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //button
            const SizedBox(height: ReGainSizes.largeSpace),
            RegainButtons(
              text: 'Pay my balance',
              onPressed: () {},
              type: ButtonType.filled,
              size: ButtonSize.large,
            )
          ],
        ),
      ),
    );
  }
}

class StyleTxt extends StatelessWidget {
  const StyleTxt(this.text, {this.color = Colors.black87, super.key});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}

class StyleBalTxt extends StatelessWidget {
  const StyleBalTxt(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
    );
  }
}

class StyleStatTxt extends StatelessWidget {
  const StyleStatTxt(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}
