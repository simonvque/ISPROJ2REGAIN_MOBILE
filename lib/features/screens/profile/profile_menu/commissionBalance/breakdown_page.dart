import 'package:flutter/material.dart';
import 'package:regain_mobile/themes/app_bar.dart';

// Sample commission breakdown data
List<Map<String, String>> commissionBreakdown = [
  {'product': 'Recycled Plastic', 'fee': 'PHP 10.00'},
  {'product': 'Iron Rod', 'fee': 'PHP 5.00'},
  {'product': 'Wire', 'fee': 'PHP 10.00'},
];

class CommissionBreakdownScreen extends StatelessWidget {
  const CommissionBreakdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate total commission
    double totalCommission = 0.0;
    for (var item in commissionBreakdown) {
      totalCommission += double.parse(
          item['fee']!.substring(4)); // Extract the number from "PHP 10.00"
    }

    return Scaffold(
      appBar: buildAppBar(context, 'Balance Breakdown'),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Scrollable List of Commission Breakdown
                  Expanded(
                    child: ListView.builder(
                      itemCount: commissionBreakdown.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(commissionBreakdown[index]['product']!),
                              Text(
                                commissionBreakdown[index]['fee']!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Fixed bar at the bottom with total commission
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Commission:',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'PHP ${totalCommission.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
