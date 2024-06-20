import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';

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
                height: MediaQuery.of(context).size.height * 0.21,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyleTxt('Your total balance:'),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        StyleBalTxt('PHP 14.00'),
                        SizedBox(width: 3),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: StyleTxt('/50.00', color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    StyleStatTxt('below limit'),
                  ],
                ),
              ),
            ),
            const SizedBox(
                height: 20), // Add spacing between the container and the button
            SizedBox(
              width: 350,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text('Pay my balance'),
              ),
            ),
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
