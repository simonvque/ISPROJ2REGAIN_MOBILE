import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';

class PenaltyPage extends StatelessWidget {
  const PenaltyPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double score = 1.0; // verify data type in database schema

    //check specific penalty points criteria from the paper :>
    Color getProgressColor(double score) {
      if (score >= 0.8) {
        return green;
      } else if (score >= 0.5) {
        return orange;
      } else {
        return red;
      }
    }

    return Scaffold(
      appBar: buildAppBar(context, 'Penalty points'),
      body: Padding(
        padding: const EdgeInsets.all(ReGainSizes.l),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(ReGainTexts.penaltyTitle,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(
                    height: ReGainSizes.spaceBtwItems,
                  ),
                  CircularPercentIndicator(
                    radius: 100.0,
                    lineWidth: 25.0,
                    percent: score,
                    animation: true,
                    center: const Icon(
                      CupertinoIcons.gauge,
                      size: 50.0,
                      color: black,
                    ),
                    backgroundColor: gray,
                    progressColor:
                        getProgressColor(score), // input score from db
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                  const SizedBox(
                    height: ReGainSizes.spaceBtwItems,
                  ),
                  const ResponsiveParagraph(
                    text: ReGainTexts.aboutPenPal,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

class ResponsiveParagraph extends StatelessWidget {
  final String text;

  const ResponsiveParagraph({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust the text style based on screen width
    TextStyle textStyle = TextStyle(
      fontSize: screenWidth * 0.04, // Adjust font size responsively
      color: Colors.black,
      fontWeight: FontWeight.w400,
    );

    // Adjust padding based on screen width
    EdgeInsets padding = EdgeInsets.symmetric(
      horizontal: screenWidth * 0.01,
      vertical: 16.0,
    );

    return Padding(
      padding: padding,
      child: Text(
        text,
        style: textStyle,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
