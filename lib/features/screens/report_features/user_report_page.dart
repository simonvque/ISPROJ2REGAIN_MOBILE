import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class UserReportPage extends StatefulWidget {
  const UserReportPage({super.key});

  @override
  UserReportPageState createState() => UserReportPageState();
}

class UserReportPageState extends State<UserReportPage> {
  String? selectedIssue;

  void selectIssue(String issue) {
    setState(() {
      selectedIssue = issue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
    child: Scaffold(
      appBar: buildAppBar(context, 'Report',
      onBackPressed: (){if (selectedIssue != null) {
            setState(() {
              selectedIssue = null; // Reset selected issue
            });
          } else {
            Navigator.of(context).pop(); // Navigate back
          }
      }
          ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Why are you reporting this user?', style: Theme.of(context).textTheme.headlineSmall,),
            //Issues buttons
            const SizedBox(
              height: 20,
            ),
            if (selectedIssue == null) ...[
              Text('Select the issue you would like to report:', 
              style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(
                height: 8,
              ),
              RegainButtons(
                  onPressed: () => selectIssue('Suspicious Account'),
                  text: 'Suspicious Account',
                  type: ButtonType.outlined,
                  size: ButtonSize.large,
                  txtSize: BtnTxtSize.large,
                  rightIcon: CupertinoIcons.chevron_forward,),
              const SizedBox(
                height: 8,
              ),
              RegainButtons(
                  onPressed: () => selectIssue('Phishing Scammer'),
                  text: 'Phishing Scammer',
                  type: ButtonType.outlined,
                  size: ButtonSize.large,
                  txtSize: BtnTxtSize.large,
                  rightIcon: CupertinoIcons.chevron_forward,),
              const SizedBox(
                height: 8,
              ),
              RegainButtons(
                  onPressed: () => selectIssue('Cancelling on deal'),
                  text: 'Cancelling on deal',
                  type: ButtonType.outlined,
                  size: ButtonSize.large,
                  txtSize: BtnTxtSize.large,
                  rightIcon: CupertinoIcons.chevron_forward,),
              const SizedBox(
                height: 8,
              ),
              RegainButtons(
                  onPressed: () => selectIssue('Selling prohibited items'),
                  text: 'Selling prohibited items',
                  type: ButtonType.outlined,
                  size: ButtonSize.large,
                  txtSize: BtnTxtSize.large,
                  rightIcon: CupertinoIcons.chevron_forward,),
              const SizedBox(
                height: 8,
              ),
              RegainButtons(
                  onPressed: () => selectIssue('Mispriced listings'),
                  text: 'Mispriced listings',
                  type: ButtonType.outlined,
                  size: ButtonSize.large,
                  txtSize: BtnTxtSize.large,
                  rightIcon: CupertinoIcons.chevron_forward,),
              const SizedBox(
                height: 8,
              ),
              RegainButtons(
                  onPressed: () => selectIssue('Offensive behavior/content'),
                  text: 'Offensive behavior/content',
                  type: ButtonType.outlined,
                  size: ButtonSize.large,
                  txtSize: BtnTxtSize.large,
                  rightIcon: CupertinoIcons.chevron_forward,),
            ] else ...[
              const SizedBox(
                height: 8,
              ),
              //Add Details Section
              AddDetailsSection(selectedIssue: selectedIssue!)
            ],
          ],
        ),
      ),
      ),
    ),
    );
  }
}

class AddDetailsSection extends StatelessWidget {
  const AddDetailsSection({super.key, required this.selectedIssue});

  final String selectedIssue;

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
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
                style: Theme.of(context).textTheme.titleMedium
              ),
              TextSpan(
                text: '*',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: red)
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

         TextField(
          maxLines: 6,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: green),
                    ),
            hintText: 'Please provide additional details.',
            hintStyle: Theme.of(context).textTheme.titleMedium
          ),
        ),

        const SizedBox(height: 20),

        RegainButtons(
          text: 'Report', 
          onPressed: (){},
          type: ButtonType.filled,
          size: ButtonSize.large,
          txtSize: BtnTxtSize.large,)
      ],
   ),
   );
  }
}
