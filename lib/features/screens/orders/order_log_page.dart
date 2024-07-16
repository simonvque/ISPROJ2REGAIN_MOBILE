import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting
import 'package:regain_mobile/features/screens/orders/status_timeline.dart';
import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';

class OrderLogPage extends StatelessWidget {
  final OrderProduct order;

  const OrderLogPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context, order.productName,
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.productName,
              style:Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Seller: ${order.sellerUsername}',
              style:Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'About Receiver:',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 4),
            Text(
              'Buyer: ${order.buyerUsername}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 4),
            Text(
              'Buyer preferred delivery date: ${order.deliveryDate}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 4),
            Text(
              'Mode of payment: ${order.paymentMode}',
              style:Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 20),
            Text(
              //conditional if the location is for delivery method (buyer address) or pickup method (seller address)
              order.isForDelivery ? 'Location (Delivery): ${order.location}' : 'Location (Pick Up): ${order.location}',
              style:Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.centerRight,
              child:  Text(
              'Total price: PHP ${order.price}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),),
            const SizedBox(height: 60),
            Text(
              'Status Timeline:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            StatusTimeline(order: order), // Display the status timeline widget
          ],
        ),
      ),
    ),
    );
  }
}

