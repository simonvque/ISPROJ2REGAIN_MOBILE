import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class ReportPage extends StatefulWidget {
  final String productName;
  final String sellerUsername;
  final String productCategory;
  final String productPrice;
  final int reporterID;
  final int reportedListingID;

  const ReportPage({
    super.key,
    required this.productName,
    required this.sellerUsername,
    required this.productCategory,
    required this.productPrice,
    required this.reporterID,
    required this.reportedListingID,
  });

  @override
  ReportPageState createState() => ReportPageState();
}

class ReportPageState extends State<ReportPage> {
  String? reportType; // 'product' or 'user'
  String? selectedIssue;
  bool showError = false;

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

  final TextEditingController detailsController = TextEditingController();

  void selectReportType(String type) {
    setState(() {
      reportType = type;
      selectedIssue = null;
      showError = false;
    });
  }

  void selectIssue(String issue) {
    setState(() {
      selectedIssue = issue;
      showError = false;
    });
  }

  Future<void> submitReport() async {
    if (selectedIssue == null || detailsController.text.trim().isEmpty) {
      setState(() {
        showError = true;
      });
      return;
    }

    final appDataSource = AppDataSource();

    if (reportType == 'product') {
      // Product report
      final reportPayload = {
        "reporterID": widget.reporterID,
        "reportedListingID": widget.reportedListingID,
        "reasonCategoryID": productIssues[selectedIssue]!,
        "details": detailsController.text,
        "timeStamp": DateTime.now().toIso8601String(),
        "reportStatus": "Pending",
      };

      try {
        final response = await appDataSource.addListingReport(reportPayload);

        if (response.responseStatus == ResponseStatus.SAVED) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Product report submitted successfully!')),
          );
          Navigator.of(context).pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Failed to submit the report: ${response.message}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } else if (reportType == 'user') {
      // User report
      final userReportPayload = {
        "reporterID": widget.reporterID,
        "reportedUserID": widget.reportedListingID,
        "reasonCategoryID": userIssues[selectedIssue]!,
        "details": detailsController.text,
        "timeStamp": DateTime.now().toIso8601String(),
        "userReportStatus": "Pending",
      };

      try {
        final response = await appDataSource.addUserReport(userReportPayload);

        if (response.responseStatus == ResponseStatus.SAVED) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('User report submitted successfully!')),
          );
          Navigator.of(context).pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Failed to submit the report: ${response.message}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Report', onBackPressed: () {
        if (selectedIssue != null) {
          setState(() {
            selectedIssue = null; // Reset selected issue
          });
        } else if (reportType != null) {
          setState(() {
            reportType = null; // Reset report type selection
          });
        } else {
          Navigator.of(context).pop(); // Navigate back
        }
      }),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (reportType == null) ...[
                // Initial selection: Report Product or User
                Text(
                  'What are you reporting?',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                RegainButtons(
                  onPressed: () => selectReportType('product'),
                  text: 'I’m reporting the product',
                  type: ButtonType.outlined,
                  size: ButtonSize.large,
                  txtSize: BtnTxtSize.large,
                  rightIcon: CupertinoIcons.chevron_forward,
                ),
                const SizedBox(height: 12),
                RegainButtons(
                  onPressed: () => selectReportType('user'),
                  text: 'I’m reporting the user',
                  type: ButtonType.outlined,
                  size: ButtonSize.large,
                  txtSize: BtnTxtSize.large,
                  rightIcon: CupertinoIcons.chevron_forward,
                ),
              ] else if (selectedIssue == null) ...[
                // Issue selection based on report type
                Text(
                  reportType == 'product'
                      ? 'Why are you reporting this product?'
                      : 'Why are you reporting this user?',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                for (String issue in reportType == 'product'
                    ? productIssues.keys
                    : userIssues.keys) ...[
                  RegainButtons(
                    onPressed: () => selectIssue(issue),
                    text: issue,
                    type: ButtonType.outlined,
                    size: ButtonSize.large,
                    txtSize: BtnTxtSize.large,
                    rightIcon: CupertinoIcons.chevron_forward,
                  ),
                  const SizedBox(height: 8),
                ],
              ] else ...[
                // Add details section after selecting an issue
                AddDetailsSection(
                  selectedIssue: selectedIssue!,
                  onSubmit: submitReport,
                  detailsController: detailsController,
                  showError: showError,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class AddDetailsSection extends StatelessWidget {
  final String selectedIssue;
  final VoidCallback onSubmit;
  final TextEditingController detailsController;
  final bool showError;

  const AddDetailsSection({
    super.key,
    required this.selectedIssue,
    required this.onSubmit,
    required this.detailsController,
    required this.showError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Selected issue:', style: Theme.of(context).textTheme.bodySmall),
        Text(selectedIssue, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Add details ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextSpan(
                text: '*',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: detailsController,
          maxLines: 6,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: showError ? Colors.red : Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: showError ? Colors.red : Colors.green),
            ),
            hintText: 'Please provide additional details.',
            hintStyle: Theme.of(context).textTheme.titleMedium,
            errorText: showError ? 'This field is required.' : null,
          ),
        ),
        const SizedBox(height: 20),
        RegainButtons(
          text: 'Submit Report',
          onPressed: onSubmit,
          type: ButtonType.filled,
          size: ButtonSize.large,
          txtSize: BtnTxtSize.large,
        ),
      ],
    );
  }
}
