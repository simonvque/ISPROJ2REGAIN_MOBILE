import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/orders/review.dart';
import 'package:regain_mobile/features/screens/orders/status_timeline.dart';
import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/order_provider.dart';
import 'package:regain_mobile/routes/route_manager.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class OrderLogPage extends StatefulWidget {
  final OrderModel order;
  final String role;

  OrderLogPage({
    Key? key,
    required this.order,
    required this.role,
  }) : super(key: key);

  @override
  State<OrderLogPage> createState() => _OrderLogPageState();
}

class _OrderLogPageState extends State<OrderLogPage> {
  late String currentStatus;

  bool _GCashEnableButtons = false;

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

  @override
  void initState() {
    // TODO: implement initState
    currentStatus = widget.order.currentStatus;

    super.initState();
  }

  void _updateOrder(String status) {
    final userId = Provider.of<AppDataProvider>(context, listen: false).userId;

    final submittedOrder = OrderModel(
        orderID: widget.order.orderID,
        product: widget.order.product,
        buyerUsername: widget.order.buyerUsername,
        deliveryMethod: widget.order.deliveryMethod,
        deliveryDate: widget.order.deliveryDate,
        paymentMethod: widget.order.paymentMethod,
        totalAmount: widget.order.totalAmount,
        currentStatus: status);
    Provider.of<OrderProvider>(context, listen: false)
        .updateOrder(submittedOrder, userId)
        .then((response) {
      if (response.statusCode == 200) {
        // Navigator.pushReplacementNamed(
        //     context, RouteManager.routeOrderTracking);
        ReGainHelperFunctions.showSnackBar(context, "Order status updated");
        setState(() {
          currentStatus = status;
        });
      } else {
        ReGainHelperFunctions.showSnackBar(context, response.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('MM/dd/yyyy').format(widget.order.deliveryDate);

    if ((widget.order.paymentMethod?.paymentType == "GCash" &&
            widget.order.paymentMethod?.status == "Confirmed") ||
        widget.order.paymentMethod?.paymentType == "Cash on Delivery") {
      _GCashEnableButtons = true;
    } else {
      _GCashEnableButtons = false;
    }

    // Decode Base64 image from order's product
    Uint8List? decodedImage;
    if (widget.order.product.image != null &&
        widget.order.product.image!.isNotEmpty) {
      try {
        decodedImage = base64Decode(widget.order.product.image!);
      } catch (e) {
        debugPrint('Error decoding product image: $e');
      }
    }

    return Scaffold(
      appBar: buildAppBar(
        context,
        widget.order.product.productName,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Product Image
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8.0),
                      image: decodedImage != null
                          ? DecorationImage(
                              image: MemoryImage(decodedImage),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: AssetImage(
                                  'assets/images/logo/logo.png'), // Replace with your placeholder asset
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  const SizedBox(width: 16.0), // Space between image and text

                  // Product Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Name
                        Text(
                          widget.order.product.productName,
                          style: Theme.of(context).textTheme.titleLarge,
                          softWrap: true, // Ensure the text wraps
                        ),
                        const SizedBox(height: 4.0),
                        // Seller Username
                        Text(
                          'Seller: ${widget.order.product.sellerUsername}',
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
                'Buyer: ${widget.order.buyerUsername}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 4),

              // Delivery Date
              Text(
                'Buyer preferred delivery date: ${formattedDate}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 4),

              // Payment Mode
              Text(
                'Mode of payment: ${widget.order.paymentMethod!.paymentType}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 20),

              // Location and Delivery Method
              Text(
                'Location:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              (widget.order.address!.unitNumber != null)
                  ? Text(
                      "${widget.order.address!.unitNumber!}, ${widget.order.address!.street}, ${widget.order.address!.barangay}, ${widget.order.address!.province}, ${widget.order.address!.zipCode}",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  : Text(
                      "${widget.order.address!.street}, ${widget.order.address!.barangay}, ${widget.order.address!.province}, ${widget.order.address!.zipCode}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
              const SizedBox(height: 16),

              Text(
                'Delivery Method:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(
                widget.order.deliveryMethod,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 50),

              // Total Price
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Total price: PHP ${widget.order.totalAmount}',
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
              //StatusTimeline(order: mockOrderProduct),
              StatusTimeline(
                order: widget.order,
                currentStatus: currentStatus,
                //orderModel: widget.order,
              ),
              const SizedBox(height: 20),
              // Conditional button based on delivery type
              if (widget.order.deliveryMethod == "Buyer Pick-up" &&
                  _GCashEnableButtons)
                _buildPickUpButtons(context),
              if (widget.order.deliveryMethod == "Seller Drop-off" &&
                  _GCashEnableButtons)
                _buildDeliverButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPickUpButtons(BuildContext context) {
    // Check the current order status and show only one button
    if (currentStatus == "To Ship" && widget.role == "buyer") {
      return Column(
        children: [
          RegainButtons(
            text: 'On the way [buyer pick-up]',
            onPressed: () {
              // change status to in transit
              _updateOrder("In Transit");
            },
            type: ButtonType.filled,
            size: ButtonSize.large,
            txtSize: BtnTxtSize.large,
          ),
          const SizedBox(height: 8), // Space between buttons
          TextButton(
            onPressed: () {
              // change status to cancelled
              _updateOrder("Cancelled");
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
    } else if (currentStatus == "In Transit" && widget.role == "buyer") {
      return RegainButtons(
        text: 'Arrived [buyer pick-up]',
        onPressed: () {
          // change status to delivered
          _updateOrder("Delivered");
        },
        type: ButtonType.filled,
        size: ButtonSize.large,
        txtSize: BtnTxtSize.large,
      );
    } else if (currentStatus == "Delivered" && widget.role == "seller") {
      return RegainButtons(
        text: 'Payment Received [COD]',
        onPressed: () {
          // Handle action for "Payment Received" button (for seller)
          _updateOrder("Received");
        },
        type: ButtonType.filled,
        size: ButtonSize.large,
        txtSize: BtnTxtSize.large,
      );
    }
    else if (currentStatus == "Received") {
      return RegainButtons(
        text: 'Review this Product',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReviewsPage(sellerUsername: widget.order.product.sellerUsername )
              ),
            );
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
    if (currentStatus == "To Ship" && widget.role == "seller") {
      return Column(
        children: [
          RegainButtons(
            text: 'Order In Transit [seller drop-off]',
            onPressed: () {
              // Handle action for "Order In Transit" button (for seller)
              // status becomes in transit
              _updateOrder("In Transit");
            },
            type: ButtonType.filled,
            size: ButtonSize.large,
            txtSize: BtnTxtSize.large,
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              // status becomes cancelled
              _updateOrder("Cancelled");
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
    } else if (currentStatus == "In Transit" && widget.role == "seller") {
      return RegainButtons(
        text: 'Order Delivered [seller drop-off]',
        onPressed: () {
          // Handle action for "Order Delivered" button (for seller)
          // status becomes delivered
          _updateOrder("Delivered");
        },
        type: ButtonType.filled,
        size: ButtonSize.large,
        txtSize: BtnTxtSize.large,
      );
    } else if (currentStatus == "Delivered" && widget.role == "buyer") {
      return RegainButtons(
        text: 'Release Payment [COD]',
        onPressed: () {
          // Handle action for "Release Payment" button (for buyer)
          // status becomes received
          _updateOrder("Received");
        },
        type: ButtonType.filled,
        size: ButtonSize.large,
        txtSize: BtnTxtSize.large,
      );
    }
    else if (currentStatus == "Received" && widget.role == "buyer") {
      return RegainButtons(
        text: 'Review this Product',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReviewsPage(sellerUsername: widget.order.product.sellerUsername)
              ),
            );
        },
        type: ButtonType.filled,
        size: ButtonSize.large,
        txtSize: BtnTxtSize.large,
      );
    }

    return SizedBox.shrink(); // Return an empty widget if no status matches
  }
}
