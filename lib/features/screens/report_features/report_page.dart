import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/features/validations/form_validators.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class ReportPage extends StatefulWidget {
  final String reportType; // 'product' or 'user'
  final String productName;
  final String sellerUsername;
  final String productCategory;
  final String productPrice;
  final int reporterID;
  final int reportedListingID;

  const ReportPage({
    super.key,
    required this.reportType,
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
  late String reportType;
  String? selectedIssue;
  bool showError = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  @override
  void initState() {
    super.initState();
    reportType =
        widget.reportType; // Set reportType from the widget's parameter
  }

  void selectIssue(String issue) {
    setState(() {
      selectedIssue = issue;
      showError = false;
    });
  }

  Future<void> submitReport() async {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        showError = true;
      });
      return;
    }

    final appDataSource = AppDataSource();

    if (reportType == 'product') {
      // Product report payload
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
      // User report payload
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
              if (selectedIssue == null) ...[
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
                  formKey: _formKey,
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
  final GlobalKey<FormState> formKey;

  const AddDetailsSection({
    super.key,
    required this.selectedIssue,
    required this.onSubmit,
    required this.detailsController,
    required this.showError,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
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
          TextFormField(
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
              errorMaxLines: 5,
            ),
            validator: (value) => Validators.ReportValidation(value,
                fieldName: 'additional details'),
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
      ),
    );
  }
}
