import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/image_strings.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Why are you reporting this product?', style: Theme.of(context).textTheme.headlineSmall,),
            const SizedBox(
              height: 12,
            ),

            //Container of the selected product to report
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.15,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Plastic Straw', style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(
                        height: ReGainSizes.spaceBtwItems /4),

                      Row(
                        children: [
                         const CircleAvatar(
                            radius: 10,
                            backgroundImage:
                                AssetImage('assets/images/profile/profileSam.jpg'),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text('@samjones', style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                      Row(
                        children: [
                          Text('Plastic', style: Theme.of(context).textTheme.bodySmall),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.30,
                          ),
                          Text('PHP150.00', style: Theme.of(context).textTheme.bodyLarge) //temporary size
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
                  onPressed: () => selectIssue('Fake Location'),
                  text: 'Fake Location',
                  type: ButtonType.outlined,
                  size: ButtonSize.large,
                  txtSize: BtnTxtSize.large,
                  rightIcon: CupertinoIcons.chevron_forward,),
              const SizedBox(
                height: 8,
              ),
              RegainButtons(
                  onPressed: () => selectIssue('Items wrongly categorized'),
                  text: 'Items wrongly categorized',
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
    );
  }
}

class AddDetailsSection extends StatelessWidget {
  const AddDetailsSection({super.key, required this.selectedIssue});

  final String selectedIssue;

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
   );
  }
}
