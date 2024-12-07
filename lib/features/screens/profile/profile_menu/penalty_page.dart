import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:intl/intl.dart';

class PenaltyPage extends StatefulWidget {
  final int userId;

  const PenaltyPage({super.key, required this.userId});

  @override
  _PenaltyPageState createState() => _PenaltyPageState();
}

class _PenaltyPageState extends State<PenaltyPage> {
  int? penaltyPoints;
  bool isLoading = true;
  final AppDataSource _appDataSource = AppDataSource();

  @override
  void initState() {
    super.initState();
    _fetchPenaltyPoints();
  }

  Future<void> _fetchPenaltyPoints() async {
    try {
      int points = await _appDataSource.getPenaltyPoints(widget.userId);
      setState(() {
        penaltyPoints = points;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        penaltyPoints = 0; // Default to 0 if an error occurs
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int maxPenaltyPoints = 50;
    int points = penaltyPoints ?? 0;

    // Normalize score to a percentage value between 0 and 1
    double score = (points / maxPenaltyPoints).clamp(0.0, 1.0);

    // Determine progress color based on penalty points
    Color getProgressColor(double score) {
      if (score >= 0.8) {
        return red;
      } else if (score >= 0.5) {
        return orange;
      } else {
        return green;
      }
    }

    // return DefaultTabController(
    //   length: 2, // Number of tabs
    //   child: Scaffold(
    //     appBar: buildAppBar(
    //       context,
    //       'Penalty Points',
    //       tabBar: TabBar(
    //         unselectedLabelColor: white,
    //         indicatorWeight: 4.0,
    //         labelStyle: Theme.of(context).textTheme.titleMedium,
    //         tabs: const [
    //           Tab(
    //             icon: Icon(CupertinoIcons.gauge),
    //             text: 'Credit Score',
    //           ),
    //           Tab(
    //             icon: Icon(CupertinoIcons.doc_text),
    //             text: 'Reports',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: isLoading
    //         ? const Center(child: CircularProgressIndicator())
    //         : TabBarView(
    //             children: [
    //               // Credit Score Tab
    //               Padding(
    //                 padding: const EdgeInsets.all(ReGainSizes.l),
    //                 child: SingleChildScrollView(
    //                   child: Center(
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //                         Text(
    //                           ReGainTexts.penaltyTitle,
    //                           style: Theme.of(context).textTheme.titleLarge,
    //                         ),
    //                         const SizedBox(height: ReGainSizes.spaceBtwItems),
    //                         CircularPercentIndicator(
    //                           radius: 100.0,
    //                           lineWidth: 25.0,
    //                           percent: score,
    //                           animation: true,
    //                           center: Text(
    //                             '$points',
    //                             style:
    //                                 Theme.of(context).textTheme.headlineLarge,
    //                           ),
    //                           backgroundColor: gray,
    //                           progressColor: getProgressColor(score),
    //                           circularStrokeCap: CircularStrokeCap.round,
    //                         ),
    //                         const SizedBox(height: ReGainSizes.spaceBtwItems),
    //                         const ResponsiveParagraph(
    //                           text: ReGainTexts.aboutPenPal,
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               // Reports Tab
    //               const ReportsTab(),
    //             ],
    //           ),
    //   ),
    // );
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
              Tab(
                icon: Icon(CupertinoIcons.doc_text),
                text: 'Reports',
              ),
            ],
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : TabBarView(
                children: [
                  // Credit Score Tab
                  Padding(
                    padding: const EdgeInsets.all(ReGainSizes.l),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Left-aligned content
                        children: [
                          // Title
                          Center(
                            child: Text(
                              ReGainTexts.penaltyTitle,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          const SizedBox(height: ReGainSizes.spaceBtwItems),

                          // Circular Progress Indicator for score
                          Center(
                            // Center-aligned for the circle progress indicator
                            child: CircularPercentIndicator(
                              radius: 100.0,
                              lineWidth: 25.0,
                              percent: score,
                              animation: true,
                              center: Text(
                                '$points',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              backgroundColor: gray,
                              progressColor: getProgressColor(score),
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                          ),
                          const SizedBox(height: ReGainSizes.largeSpace),

                          // Expandable Sections
                          ExpansionTile(
                            title: Text(
                              'What are Penalty Points?',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                'Penalty points are based on your interactions within the app, such as reporting issues or violations. Your credit score reflects how well you maintain a positive presence in our community.',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                          ExpansionTile(
                            title: Text(
                              'Penalty Points Breakdown',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                '• 50 points: Banned (Permanent loss of access)\n'
                                '• 30 points: Frozen (Temporary suspension)\n'
                                '• 15 points: Restricted (Limited access)',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                          ExpansionTile(
                            title: Text(
                              'Reset Schedule',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                'Penalty points and account status reset every Monday of the fiscal quarter. However, if you accumulate 50 penalty points, your account will be permanently banned.',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                          ExpansionTile(
                            title: Text(
                              'Need Help or Want to Appeal?',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                'If you have any issues or want to make an appeal, email us at regain.helpservice@gmail.com.',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ],
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

    // Text style based on screen width
    TextStyle textStyle = TextStyle(
      fontSize: screenWidth * 0.04,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    );

    // Padding based on screen width
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

// Product report categories with IDs
final Map<String, int> productIssues = {
  'Prohibited Listing': 4,
  'Spam Listing': 9,
  'Improper Product Name': 10,
  'Item Wrongly Categorized': 3,
  'Mispriced Listing': 5,
};

// User report categories with IDs
final Map<String, int> userIssues = {
  'Suspicious Account': 1,
  'Fake Location': 2,
  'Offensive Behavior': 6,
  'Chat Spam': 7,
  'False Transaction Attempts': 8,
  'Empty Parcel': 11,
  'Outside Transaction': 12,
  'Improper Username': 13,
};

// Combine and reverse for lookup
final Map<int, String> categoryNames = {
  for (var entry in productIssues.entries) entry.value: entry.key,
  for (var entry in userIssues.entries) entry.value: entry.key,
};

String formatTimestamp(String? timestamp) {
  if (timestamp == null) return 'No date';
  try {
    final dateTime = DateTime.parse(timestamp);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  } catch (e) {
    return 'Invalid date';
  }
}

class ReportsTab extends StatelessWidget {
  const ReportsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final appDataProvider =
        Provider.of<AppDataProvider>(context, listen: false);
    final userId = appDataProvider.userId;

    if (userId == null) {
      return const Center(child: Text('User ID not found. Please log in.'));
    }

    return FutureBuilder<Map<String, List<dynamic>>>(
      future: AppDataSource().getUserAndListingReports(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'No reports found.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          final combinedReports = snapshot.data!;
          final List<dynamic> userReports =
              combinedReports['userReports'] ?? [];
          final List<dynamic> listingReports =
              combinedReports['listingReports'] ?? [];

          if (userReports.isEmpty && listingReports.isEmpty) {
            return const Center(
              child: Text(
                'No reports found.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.separated(
              itemCount: userReports.length + listingReports.length,
              itemBuilder: (context, index) {
                final report = index < userReports.length
                    ? userReports[index]
                    : listingReports[index - userReports.length];

                final categoryId = report['reasonCategoryID'] as int?;
                final categoryName =
                    categoryNames[categoryId] ?? 'Unknown Category';
                final timeStamp = formatTimestamp(report['timeStamp']);
                final isUserReport = index < userReports.length;

                // Adjust status based on report type (user or listing)
                final status = isUserReport
                    ? report['userReportStatus'] ?? 'No status'
                    : report['reportStatus'] ?? 'No status';

                // Assign color based on status
                Color statusColor;
                if (status == 'Pending') {
                  statusColor = Colors.grey;
                } else if (status == 'Accepted') {
                  statusColor = Colors.green;
                } else if (status == 'Declined') {
                  statusColor = Colors.red;
                } else {
                  statusColor = Colors.grey;
                }

                return ListTile(
                  title: Text(
                    '${isUserReport ? 'Report User' : 'Report Listing'}: $categoryName',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    'Reported on: $timeStamp',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  trailing: Text(
                    status,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: statusColor,
                        ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Divider(thickness: 1, height: 1),
            ),
          );
        }
      },
    );
  }
}

// class ReportsTab extends StatelessWidget {
//   const ReportsTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Sample data for reports
//     final List<Report> reports = [
//       Report('Report User: Inappropriate behavior', 'Reported on: 2024-07-01',
//           'Reviewing'),
//       Report('Report Listing: Spam listing', 'Reported on: 2024-06-30',
//           'Resolved'),
//       Report('Report User: Inappropriate behavior', 'Reported on: 2024-07-01',
//           'Reviewing'),
//       Report('Report Listing: Spam listing', 'Reported on: 2024-06-30',
//           'Resolved'),
//     ];

//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: ListView.separated(
//         itemCount: reports.length,
//         itemBuilder: (context, index) {
//           final report = reports[index];
//           return ListTile(
//             title: Text(report.title,
//                 style: Theme.of(context).textTheme.titleLarge),
//             subtitle: Text(report.subtitle,
//                 style: Theme.of(context).textTheme.labelMedium),
//             trailing: Text(
//               report.status,
//               style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                     color: report.status == 'Resolved' ? green : orange,
//                   ),
//             ),
//           );
//         },
//         separatorBuilder: (context, index) =>
//             const Divider(thickness: 1, height: 1),
//       ),
//     );
//   }
// }

class Report {
  final String title;
  final String subtitle;
  final String status;

  Report(this.title, this.subtitle, this.status);
}
