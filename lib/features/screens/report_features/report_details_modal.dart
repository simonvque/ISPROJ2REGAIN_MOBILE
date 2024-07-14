import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';

class ReportDetailsModal extends StatelessWidget {
  final String title;
  final String subtitle;
  final String adminMessage;
  final String status;

  const ReportDetailsModal({
    super.key,
    required this.title,
    required this.subtitle,
    required this.adminMessage,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.60,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          //drag button element
          Align(
            alignment: Alignment.center,
          child: Container(
          margin: const EdgeInsets.only(top: 6.0, bottom: 8.0),
          width: 40.0, 
          height: 6.5, 
          decoration: BoxDecoration(color: gray, borderRadius: BorderRadius.circular(50)),
        ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Message from Admin:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: gray),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              child: Text(
              adminMessage,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ),
          ),
           const SizedBox(height: 8),
          Row(
          children: [
            Text(
              'Status of the report: ',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(width: 6),
            Text(
              status,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: status == 'Resolved' ? green : orange,
              ),
            ),
          ],
        ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the modal
                },
                child: Text('Close', style: Theme.of(context).textTheme.titleLarge),
              ),
            ]
          ),
        ],
      ),
    );
  }
}
