import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/features/screens/report_features/report_details_modal.dart';

class PenaltyPage extends StatelessWidget {
  final int? penaltyPoints;
  const PenaltyPage({super.key, required this.penaltyPoints});

  @override
  Widget build(BuildContext context) {
    //double score = 1.0; // verify data type in database schema

    double score = penaltyPoints!.toDouble();

    // Check specific penalty points criteria
    Color getProgressColor(double score) {
      if (score >= 0.8) {
        return green;
      } else if (score >= 0.5) {
        return orange;
      } else {
        return red;
      }
    }

    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: buildAppBar(
          context,
          'Penalty Points',
          tabBar: TabBar(
            unselectedLabelColor: white,
            indicatorWeight: 4.0,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            tabs: const [
              Tab(
                icon: Icon(CupertinoIcons.gauge),
                text: 'Credit Score',
              ),
              Tab(icon: Icon(CupertinoIcons.doc_text), text: 'Reports'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Credit Score Tab
            Padding(
              padding: const EdgeInsets.all(ReGainSizes.l),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ReGainTexts.penaltyTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: ReGainSizes.spaceBtwItems),
                      CircularPercentIndicator(
                        radius: 100.0,
                        lineWidth: 25.0,
                        percent: score,
                        animation: true,
                        // center: const Icon(
                        //   CupertinoIcons.gauge,
                        //   size: 50.0,
                        //   color: black,
                        // ),
                        center: Text('$score',
                            style: Theme.of(context).textTheme.headlineLarge),

                        backgroundColor: gray,
                        progressColor: getProgressColor(score),
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                      const SizedBox(height: ReGainSizes.spaceBtwItems),
                      const ResponsiveParagraph(
                        text: ReGainTexts.aboutPenPal,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Reports Tab
            const ReportsTab(),
          ],
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

    // txtstyle based on screen width
    TextStyle textStyle = TextStyle(
      fontSize: screenWidth * 0.04,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    );

    // padding based on screen width
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

// Sample data for reports
class Report {
  final String title;
  final String subtitle;
  final String status;

  Report(this.title, this.subtitle, this.status);
}

class ReportsTab extends StatelessWidget {
  const ReportsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for reports
    final List<Report> reports = [
      Report('Report User: Inappropriate behavior', 'Reported on: 2024-07-01',
          'Reviewing'),
      Report('Report Listing: Spam listing', 'Reported on: 2024-06-30',
          'Resolved'),
      Report('Report User: Inappropriate behavior', 'Reported on: 2024-07-01',
          'Reviewing'),
      Report('Report Listing: Spam listing', 'Reported on: 2024-06-30',
          'Resolved'),
      Report('Report User: Inappropriate behavior', 'Reported on: 2024-07-01',
          'Reviewing'),
      Report('Report Listing: Spam listing', 'Reported on: 2024-06-30',
          'Resolved'),
    ];

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.separated(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return ListTile(
            title: Text(report.title,
                style: Theme.of(context).textTheme.titleLarge),
            subtitle: Text(report.subtitle,
                style: Theme.of(context).textTheme.labelMedium),
            trailing: Text(report.status,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: report.status == 'Resolved' ? green : orange,
                    )),
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return ReportDetailsModal(
                    title: report.title,
                    subtitle: report.subtitle,
                    adminMessage:
                        'This is a message from the admin regarding the report. It could be a detailed response or instructions.',
                    status: report.status,
                  );
                },
              );
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(
          thickness: 1,
          height: 1,
        ),
      ),
    );
  }
}
