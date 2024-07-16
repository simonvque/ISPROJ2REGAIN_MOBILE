import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart';

//overall widget of the status
class StatusTimeline extends StatelessWidget {
  final OrderProduct order;

  const StatusTimeline({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: order.statusList.asMap().entries.map((entry) {
        final index = entry.key;
        final statusItem = entry.value;
        return StatusItem(
          status: statusItem.toString().split('.').last,
          timestamp: DateTime.now(), // Replace with actual timestamp from statusItem
          isCurrent: index == 0, // Determine if it's the current status
        );
      }).toList(),
    );
  }
}

//for each status
class StatusItem extends StatelessWidget {
  final String status;
  final DateTime timestamp;
  final bool isCurrent;

  const StatusItem({
    Key? key,
    required this.status,
    required this.timestamp,
    required this.isCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCurrent ? green : gray.withOpacity(0.5),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            status,
            style: TextStyle(
              fontSize: 16,
              color: isCurrent ? black : gray.withOpacity(0.5),
            ),
          ),
          const Spacer(),
          Text(
            DateFormat('dd/MM/yyyy').format(timestamp), // Format the timestamp
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
