import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class CommissionPage extends StatefulWidget {
  const CommissionPage({super.key});

  @override
  CommissionPageState createState() => CommissionPageState();
}

class CommissionPageState extends State<CommissionPage> {
  // insert dynamic data
  double commissionAmount = 25;

  // to change conditions
  Map<String, dynamic> getStatus(double amount) {
    if (amount > 50.00) {
      return {
        'message': 'Almost limit',
        'color': Colors.red,
      };
    } else {
      return {
        'message': 'Under limit',
        'color': Colors.green,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = getStatus(commissionAmount);
    String? commissionBalance =
        Provider.of<AppDataProvider>(context, listen: false)
            .user
            ?.commissionBalance;
    commissionBalance ??= commissionAmount.toString();

    return Scaffold(
      appBar: buildAppBar(context, 'Commission balance'),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(ReGainTexts.comBalHeading,
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: ReGainSizes.spaceBtwItems / 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('PHP $commissionBalance',
                          style: Theme.of(context).textTheme.headlineLarge),
                      const SizedBox(width: ReGainSizes.spaceBtwItems / 4),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(ReGainTexts.comBalMax,
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                    ],
                  ),
                  const SizedBox(height: ReGainSizes.spaceBtwItems),
                  Text(status['message'],
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: status['color'])),
                ],
              ),
            ),

            // Button
            const SizedBox(height: ReGainSizes.largeSpace),
            RegainButtons(
              text: 'Pay my balance',
              onPressed: () {},
              type: ButtonType.filled,
              size: ButtonSize.large,
              txtSize: BtnTxtSize.large,
            ),
          ],
        ),
      ),
    );
  }
}
