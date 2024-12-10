import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/commissionBalance/breakdown_page.dart';
import 'package:regain_mobile/features/screens/qr_payment/scan_qr_page.dart';
import 'package:regain_mobile/model/commissions_model.dart';
import 'package:regain_mobile/model/commissions_total.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/commissions_provider.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class CommissionPage extends StatefulWidget {
  const CommissionPage({super.key});

  @override
  CommissionPageState createState() => CommissionPageState();
}

class CommissionPageState extends State<CommissionPage> {
  double commissionAmount = 25.00;
  static const double commissionLimit = 50.00;

  // final status = getStatus(commissionAmount);
  // String? commissionBalance =
  //     Provider.of<AppDataProvider>(context, listen: false)
  //         .user
  //         ?.commissionBalance;
  // commissionBalance ??= commissionAmount.toString();

  Map<String, dynamic> getStatus(double amount) {
    if (amount >= commissionLimit) {
      return {
        'message': 'Almost limit',
        'color': Colors.red,
      };
    } else {
      return {
        'message': 'Below limit',
        'color': Colors.green,
      };
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _fetchData();
    super.didChangeDependencies();
  }

  void _fetchData() async {
    int userId = Provider.of<AppDataProvider>(context, listen: false).userId;
    await Provider.of<CommissionsProvider>(context, listen: false)
        .getCommissions(userId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<CommissionsModel>? comms =
        Provider.of<CommissionsProvider>(context, listen: true).commissionsList;

    String commAmount = "0.00";
    if (comms.isNotEmpty) {
      CommissionsTotal combal =
          Provider.of<CommissionsProvider>(context, listen: true)
              .commissionsModel;
      commAmount = combal.totalBal;
      //List<CommissionsModel> commList = comms.commsList!;
    }

    final status = getStatus(double.parse(commAmount));
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth > 600 ? 40 : 24;
    double fontSize = screenWidth > 600 ? 24 : 20;

    return Scaffold(
      appBar: buildAppBar(context, 'Commission Balance'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: screenWidth * 0.90,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your total balance',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'PHP ${commAmount}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(fontSize: fontSize),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '/ $commissionLimit',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: status['color'],
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      alignment: Alignment.center,
                      child: Text(
                        status['message'],
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),

              // CTA Buttons
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommissionBreakdownScreen(
                                commsList: comms,
                                commBal: commAmount,
                              )));
                },
                style: TextButton.styleFrom(
                  foregroundColor: black,
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ).copyWith(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
                child: const Text(
                  'View Balance Breakdown',
                  style: TextStyle(
                    fontWeight: FontWeight.w600, // Semibold
                    fontSize: 14, // Font size 14
                    decoration: TextDecoration.underline, // Underline text
                  ),
                ),
              ),

              const SizedBox(height: 24),
              RegainButtons(
                text: 'Pay my balance',
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const ScanQRPage()),
                  // );
                },
                type: ButtonType.filled,
                size: ButtonSize.large,
                txtSize: BtnTxtSize.large,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
