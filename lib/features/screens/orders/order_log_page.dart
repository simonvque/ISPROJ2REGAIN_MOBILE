// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // Import for date formatting
// import 'package:regain_mobile/features/screens/orders/status_timeline.dart';
// import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart';
// import 'package:regain_mobile/themes/app_bar.dart';
// import 'package:regain_mobile/model/order_model.dart';

// class OrderLogPage extends StatelessWidget {
//   // final OrderProduct order;
//   final OrderModel orderModel;

//   const OrderLogPage({Key? key, required this.orderModel}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(
//           context,
//           // orderModel.productName,
//           orderModel.product.productName),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 orderModel.product.productName,
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//               Text(
//                 'Seller: ${orderModel.product.sellerUsername}',
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'About Receiver:',
//                 style: Theme.of(context).textTheme.titleSmall,
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 'Buyer: ${orderModel.buyerUsername}',
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 'Buyer preferred delivery date: ${orderModel.deliveryDate}',
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 'Mode of payment: ${orderModel.paymentMethod!.paymentType}',
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 //conditional if the location is for delivery method (buyer address) or pickup method (seller address)
//                 (orderModel.deliveryMethod == "Seller Drop-off")
//                     ? 'Location (Delivery): ${orderModel.address!.city}'
//                     : 'Location (Pick Up): ${orderModel.product.location}',
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//               const SizedBox(height: 50),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   'Total price: PHP ${orderModel.totalAmount}',
//                   style: Theme.of(context).textTheme.headlineSmall,
//                 ),
//               ),
//               const SizedBox(height: 60),
//               Text(
//                 'Status Timeline:',
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//               const SizedBox(height: 8),
//               // StatusTimeline(
//               //     order: orderModel), // Display the status timeline widget
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:regain_mobile/features/screens/orders/status_timeline.dart';
// import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart';  // Import your status timeline

// class OrderLogPage extends StatelessWidget {
//   // Temporary data to replace backend call
//   final OrderProduct mockOrderProduct = OrderProduct(
//     sellerUsername: "seller123",
//     buyerUsername: "buyer123",
//     productName: "Product 1",
//     price: "150.00",
//     location: "Barangay XYZ, Manila",
//     isForDelivery: true,
//     deliveryDate: "2024-11-30",
//     paymentMode: "Cash on Delivery",
//     statusList: [
//       OrderStatus.toShip,
//       OrderStatus.inTransit,
//       OrderStatus.delivered,
//       OrderStatus.received,
//       OrderStatus.cancelled,
//     ], // Mock status list
//   );

//   OrderLogPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(mockOrderProduct.productName), // Display product name
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Product Name
//               Text(
//                 mockOrderProduct.productName,
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//               // Seller Username
//               Text(
//                 'Seller: ${mockOrderProduct.sellerUsername}',
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'About Receiver:',
//                 style: Theme.of(context).textTheme.titleSmall,
//               ),
//               const SizedBox(height: 4),
//               // Buyer Username
//               Text(
//                 'Buyer: ${mockOrderProduct.buyerUsername}',
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//               const SizedBox(height: 4),
//               // Delivery Date
//               Text(
//                 'Buyer preferred delivery date: ${mockOrderProduct.deliveryDate}',
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//               const SizedBox(height: 4),
//               // Payment Mode
//               Text(
//                 'Mode of payment: ${mockOrderProduct.paymentMode}',
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 // Conditional location message based on delivery method
//                 (mockOrderProduct.isForDelivery)
//                     ? 'Location (Delivery): ${mockOrderProduct.location}' 
//                     : 'Location (Pick Up): ${mockOrderProduct.location}',
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//               const SizedBox(height: 50),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   'Total price: PHP ${mockOrderProduct.price}',
//                   style: Theme.of(context).textTheme.headlineSmall,
//                 ),
//               ),
//               const SizedBox(height: 60),
//               Text(
//                 'Status Timeline:',
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//               const SizedBox(height: 8),
//               // Pass the mockOrderProduct to the StatusTimeline widget
//               StatusTimeline(order: mockOrderProduct),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/orders/status_timeline.dart';
import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class OrderLogPage extends StatelessWidget {
  // Temporary data to replace backend call
  final OrderProduct mockOrderProduct = OrderProduct(
    sellerUsername: "seller123",
    buyerUsername: "buyer123",
    productName: "Product 1",
    price: "150.00",
    location: "Barangay XYZ, Manila",
    isForDelivery: true, // Change to false for pick-up
    deliveryDate: "2024-11-30",
    paymentMode: "Cash on Delivery",
    statusList: [
      //set order status
      OrderStatus.toShip,
      OrderStatus.inTransit,
      OrderStatus.delivered,
      OrderStatus.received,
      OrderStatus.cancelled,
    ],
  );

  OrderLogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
          context,
          mockOrderProduct.productName,
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: [
        // Photo Box
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Icon(Icons.image, color: Colors.grey), // Placeholder image
        ),
        const SizedBox(width: 16.0), // Space between image and text

        // Product Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Name
              Text(
                mockOrderProduct.productName,
                style: Theme.of(context).textTheme.titleLarge,
                softWrap: true, // Ensure the text wraps
              ),
              const SizedBox(height: 4.0),
              // Seller Username
              Text(
                'Seller: ${mockOrderProduct.sellerUsername}',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ],
          ),
        ),
      ],
    ),
    const SizedBox(height: 20),

    // About Receiver Section
    Row(
      children: [
        // User Icon
        const Icon(Icons.person, color: green600),
        const SizedBox(width: 8.0), // Space between icon and text
        Text(
          'About Receiver:',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    ),
    const SizedBox(height: 4),

    // Buyer Username
    Text(
      'Buyer: ${mockOrderProduct.buyerUsername}',
      style: Theme.of(context).textTheme.bodySmall,
    ),
    const SizedBox(height: 4),

    // Delivery Date
    Text(
      'Buyer preferred delivery date: ${mockOrderProduct.deliveryDate}',
      style: Theme.of(context).textTheme.bodySmall,
    ),
    const SizedBox(height: 4),

    // Payment Mode
    Text(
      'Mode of payment: ${mockOrderProduct.paymentMode}',
      style: Theme.of(context).textTheme.bodySmall,
    ),
    const SizedBox(height: 20),

    // Location and Delivery Method
    Text(
      'Location:',
      style: Theme.of(context).textTheme.titleMedium,
    ),
    const SizedBox(height: 4),
    Text(
      mockOrderProduct.location,
      style: Theme.of(context).textTheme.bodyMedium,
    ),
    const SizedBox(height: 16),

    Text(
      'Delivery Method:',
      style: Theme.of(context).textTheme.titleMedium,
    ),
    const SizedBox(height: 4),
    Text(
      mockOrderProduct.isForDelivery ? 'Delivery' : 'Pick Up',
      style: Theme.of(context).textTheme.bodyMedium,
    ),

    const SizedBox(height: 50),

    // Total Price
    Align(
      alignment: Alignment.centerRight,
      child: Text(
        'Total price: PHP ${mockOrderProduct.price}',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    ),
             
             //Status Timeline Widget
              const SizedBox(height: 24),
              Text(
                'Status Timeline:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              // Pass the mockOrderProduct to the StatusTimeline widget
              StatusTimeline(order: mockOrderProduct),
              const SizedBox(height: 20),
              // Conditional button based on delivery type
              if (!mockOrderProduct.isForDelivery)
                _buildPickUpButtons(context),
              if (mockOrderProduct.isForDelivery)
                _buildDeliverButtons(context),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildPickUpButtons(BuildContext context) {
  // Check the current order status and show only one button
  if (mockOrderProduct.statusList.contains(OrderStatus.toShip)) {
    return Column(
      children: [
        RegainButtons(
          text: 'On the way [buyer pick-up]',
          onPressed: () {
            // Handle action for "On the way" button (for buyer)
          },
          type: ButtonType.filled,
          size: ButtonSize.large,
          txtSize: BtnTxtSize.large,
        ),
        const SizedBox(height: 8), // Space between buttons
          TextButton(
          onPressed: () {
            // Handle action for "Cancel" button
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.red, 
          ),
          child: Text(
            'Cancel Order',
            style: TextStyle(
              fontSize: 16, // Adjust font size as needed
            ),
          ),
        ),      ],
    );
  } else if (mockOrderProduct.statusList.contains(OrderStatus.inTransit)) {
    return RegainButtons(
      text: 'Arrived [buyer pick-up]',
      onPressed: () {
        // Handle action for "Arrived" button (for buyer)
      },
      type: ButtonType.filled,
      size: ButtonSize.large,
      txtSize: BtnTxtSize.large,
    );
  } else if (mockOrderProduct.statusList.contains(OrderStatus.delivered)) {
    return RegainButtons(
      text: 'Payment Received [COD]',
      onPressed: () {
        // Handle action for "Payment Received" button (for seller)
      },
      type: ButtonType.filled,
      size: ButtonSize.large,
      txtSize: BtnTxtSize.large,
    );
  } else if (mockOrderProduct.statusList.contains(OrderStatus.received)) {
    return RegainButtons(
      text: 'Received',
      onPressed: () {
        // Handle action for "Received" button
      },
      type: ButtonType.filled,
      size: ButtonSize.large,
      txtSize: BtnTxtSize.large,
    );
  }

  return SizedBox.shrink(); // Return an empty widget if no status matches
}

Widget _buildDeliverButtons(BuildContext context) {
  // Check the current order status and show only one button
  if (mockOrderProduct.statusList.contains(OrderStatus.toShip)) {
    return Column(
      children: [
          RegainButtons(
          text: 'Order In Transit [seller drop-off]',
          onPressed: () {
            // Handle action for "Order In Transit" button (for seller)
          },
          type: ButtonType.filled,
          size: ButtonSize.large,
          txtSize: BtnTxtSize.large,
        ),
          const SizedBox(height: 8),
          TextButton(
          onPressed: () {
            // Handle action for "Cancel" button
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.red, 
          ),
          child: Text(
            'Cancel Order',
            style: TextStyle(
              fontSize: 16, // Adjust font size as needed
            ),
          ),
        ),
      ],
    );
  } else if (mockOrderProduct.statusList.contains(OrderStatus.inTransit)) {
    return RegainButtons(
      text: 'Order Delivered [seller drop-off]',
      onPressed: () {
        // Handle action for "Order Delivered" button (for seller)
      },
      type: ButtonType.filled,
      size: ButtonSize.large,
      txtSize: BtnTxtSize.large,
    );
  } else if (mockOrderProduct.statusList.contains(OrderStatus.delivered)) {
    return RegainButtons(
      text: 'Release Payment [COD]',
      onPressed: () {
        // Handle action for "Release Payment" button (for buyer)
      },
      type: ButtonType.filled,
      size: ButtonSize.large,
      txtSize: BtnTxtSize.large,
    );
  } else if (mockOrderProduct.statusList.contains(OrderStatus.received)) {
    return RegainButtons(
      text: 'Received',
      onPressed: () {
        // Handle action for "Received" button
      },
      type: ButtonType.filled,
      size: ButtonSize.large,
      txtSize: BtnTxtSize.large,
    );
  }

  return SizedBox.shrink(); // Return an empty widget if no status matches
}

}