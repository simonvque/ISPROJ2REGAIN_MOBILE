import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting
import 'package:regain_mobile/features/screens/orders/status_timeline.dart';
import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/model/order_model.dart';

class OrderLogPage extends StatelessWidget {
  // final OrderProduct order;
  final OrderModel orderModel;

  const OrderLogPage({Key? key, required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          context,
          // orderModel.productName,
          orderModel.product.productName),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderModel.product.productName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Seller: ${orderModel.product.sellerUsername}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Text(
                'About Receiver:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 4),
              Text(
                'Buyer: ${orderModel.buyerUsername}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 4),
              Text(
                'Buyer preferred delivery date: ${orderModel.deliveryDate}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 4),
              Text(
                'Mode of payment: ${orderModel.paymentMethod!.paymentType}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 20),
              Text(
                //conditional if the location is for delivery method (buyer address) or pickup method (seller address)
                (orderModel.deliveryMethod == "Seller Drop-off")
                    ? 'Location (Delivery): ${orderModel.address!.city}'
                    : 'Location (Pick Up): ${orderModel.product.location}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Total price: PHP ${orderModel.totalAmount}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: 60),
              Text(
                'Status Timeline:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              // StatusTimeline(
              //     order: orderModel), // Display the status timeline widget
            ],
          ),
        ),
      ),
    );
  }
}
