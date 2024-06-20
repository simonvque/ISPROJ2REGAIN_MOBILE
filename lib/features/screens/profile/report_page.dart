import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/image_strings.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu.dart';
import 'package:regain_mobile/features/screens/profile/profile_page.dart';

/*
TO FIX: STATE WHEN ALREADY IN THE ADD DETAILS SECTION, THE BACKBTN FROM APP BAR 
        MUST RETURN IN MAIN REPORT FORM AND NOT IN PREVIOUS PAGE.
 */

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  ReportPageState createState() => ReportPageState();
}

class ReportPageState extends State<ReportPage> {
  String? selectedIssue;

  void selectIssue(String issue) {
    setState(() {
      selectedIssue = issue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Report'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StyleUsernameTxt('Why are you reporting this product?'),
            const SizedBox(
              height: 12,
            ),

            //Container of the selected product to report
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.width * 0.275,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Row(
                children: [
                  //Product Image
                  ClipRRect(
                    child: Image.asset(
                      ReGainImages.exProductPic,
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.20,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(
                    width: 8,
                  ),
                  //Product Info
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyleUsernameTxt('Plastic Straw'),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundImage:
                                AssetImage('assets/profileSam.jpg'),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          StyleBodyTxt('@samjones')
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          StyleBodyTxt('Plastic'),
                          SizedBox(
                            width: 120,
                          ),
                          StyleUsernameTxt('PHP150.00') //temporary size
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),

            //Issues buttons
            const SizedBox(
              height: 20,
            ),
            if (selectedIssue == null) ...[
              const StyleBodyTxt('Select the issue you would like to report:'),
              const SizedBox(
                height: 8,
              ),
              IssueBtn(
                  onPressed: () => selectIssue('Suspicious Account'),
                  text: 'Suspicious Account'),
              const SizedBox(
                height: 8,
              ),
              IssueBtn(
                  onPressed: () => selectIssue('Fake Location'),
                  text: 'Fake Location'),
              const SizedBox(
                height: 8,
              ),
              IssueBtn(
                  onPressed: () => selectIssue('Items wrongly categorized'),
                  text: 'Items wrongly categorized'),
              const SizedBox(
                height: 8,
              ),
              IssueBtn(
                  onPressed: () => selectIssue('Selling prohibited items'),
                  text: 'Selling prohibited items'),
              const SizedBox(
                height: 8,
              ),
              IssueBtn(
                  onPressed: () => selectIssue('Mispriced listings'),
                  text: 'Mispriced listings'),
              const SizedBox(
                height: 8,
              ),
              IssueBtn(
                  onPressed: () => selectIssue('Offensive behavior/content'),
                  text: 'Offensive behavior/content'),
            ] else ...[
              const SizedBox(
                height: 8,
              ),
              //Add Details Section
              AddDetailsSection(selectedIssue: selectedIssue)
            ],
          ],
        ),
      ),
    );
  }
}

class IssueBtn extends StatelessWidget {
  const IssueBtn({super.key, required this.onPressed, required this.text});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      height: MediaQuery.of(context).size.width * 0.12,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black87,
                side: const BorderSide(color: Colors.grey),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)))
            .copyWith(
                overlayColor: const WidgetStatePropertyAll(Colors.transparent)),
        onPressed: onPressed,
        child: Row(children: [
          StyleBtnTxt(text),
          const Spacer(flex: 40),
          const Icon(CupertinoIcons.chevron_forward),
        ]),
      ),
    );
  }
}

class AddDetailsSection extends StatelessWidget {
  const AddDetailsSection({super.key, required this.selectedIssue});

  final String? selectedIssue;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const StyleBodyTxt('Selected issue:'),
      StyleBtnTxt(selectedIssue!),

      const SizedBox(
        height: 20,
      ),
      // const StyleUsernameTxt('Add details'),
      RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Add details ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: '*',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),

      const SizedBox(
        height: 8,
      ),
      const TextField(
        maxLines: 5,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Please provide additional deatails.',
        ),
      ),

      SizedBox(height: MediaQuery.of(context).size.height * 0.20),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.90,
        child: FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: green,
                foregroundColor: white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: () {
              //insert handle here
            },
            child: const Text('Report')),
      ),
    ]);
  }
}
