import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/homepage/selected_item.dart';
import 'package:regain_mobile/features/screens/orders/order_log_page.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/order_provider.dart';
import 'package:regain_mobile/themes/app_bar.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  _OrderTrackingPageState createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  // Temporary data for UI demo (with status field for dynamic updates)

  bool buyerLoaded = false;
  bool sellerLoaded = false;

  List<OrderModel> buyerOrders = [];

  List<OrderModel> sellerOrders = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    fetchData();
    super.didChangeDependencies();
  }

  void fetchData() async {
    final user = Provider.of<AppDataProvider>(context, listen: false).userId;

    buyerOrders = await Provider.of<OrderProvider>(context, listen: false)
        .getOrdersByBuyer(user);
    sellerOrders = await Provider.of<OrderProvider>(context, listen: false)
        .getOrdersBySeller(user);

    setState(() {});

    // if (buyerOrders.isNotEmpty || sellerOrders.isNotEmpty) {
    //   setState(() {});
    // }
  }

  @override
  Widget build(BuildContext context) {
    //fetchData();
    List<OrderModel>? buyerlist =
        Provider.of<OrderProvider>(context, listen: true).ordersBuyer;

    List<OrderModel>? sellerList =
        Provider.of<OrderProvider>(context, listen: true).ordersSeller;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(
          context,
          'My Orders',
          tabBar: TabBar(
            unselectedLabelColor: white,
            indicatorWeight: 4.0,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            tabs: const [
              Tab(text: 'As Buyer'),
              Tab(text: 'As Seller'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrderList(buyerlist!, "buyer"),
            _buildOrderList(sellerList!, "seller"),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(List<OrderModel> orderList, String method) {
    String role = method;

    if (role == "buyer")
      return ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          final order = orderList[index];
          final productImageBase64 = order.product.image;

          // Decode Base64 image
          Uint8List? decodedImage;
          if (productImageBase64 != null && productImageBase64.isNotEmpty) {
            try {
              decodedImage = base64Decode(productImageBase64);
            } catch (e) {
              debugPrint('Error decoding product image: $e');
            }
          }

          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0, vertical: 10.0), // Adjust spacing
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderLogPage(
                              order: order,
                              role: role,
                            )));
                debugPrint(
                    "Navigating to log page for Order ID: ${order.orderID}");
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Align text to the top to avoid misalignment
                  children: [
                    // Product Image Box
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
                                    'assets/placeholder.png'), // Replace with your placeholder asset
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
                          GestureDetector(
                            child: Text(
                              '${order.product.productName}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap:
                                  true, // Ensure the text wraps instead of being truncated
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SelectedItemScreen(
                                          item: order.product)));
                            },
                          ),
                          const SizedBox(height: 4.0),
                          // Username
                          if (role == "buyer")
                            Text(
                              "User: ${order.product.sellerUsername}",
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: gray,
                              ),
                              softWrap:
                                  true, // Ensure the text wraps instead of being truncated
                            )
                          else if (role == "seller")
                            Text(
                              "User: ${order.buyerUsername}",
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: gray,
                              ),
                              softWrap:
                                  true, // Ensure the text wraps instead of being truncated
                            ),
                          const SizedBox(height: 4.0),
                          // Price
                          Text(
                            "${order.totalAmount}",
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: black,
                            ),
                            softWrap:
                                true, // Ensure the text wraps instead of being truncated
                          ),
                        ],
                      ),
                    ),

                    // Order Status
                    Text(
                      order.currentStatus,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: green600,
                      ),
                      softWrap:
                          true, // Ensure the text wraps instead of being truncated
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    else
      return Consumer<OrderProvider>(
        builder: (context, provider, child) => ListView.builder(
          itemCount: provider.ordersSeller!.length,
          itemBuilder: (context, index) {
            final order = provider.ordersSeller![index];
            final productImageBase64 = order.product.image;

            // Decode Base64 image
            Uint8List? decodedImage;
            if (productImageBase64 != null && productImageBase64.isNotEmpty) {
              try {
                decodedImage = base64Decode(productImageBase64);
              } catch (e) {
                debugPrint('Error decoding product image: $e');
              }
            }

            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 10.0), // Adjust spacing
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderLogPage(
                                order: order,
                                role: role,
                              )));
                  debugPrint(
                      "Navigating to log page for Order ID: ${order.orderID}");
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Align text to the top to avoid misalignment
                    children: [
                      // Product Image Box
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
                      const SizedBox(
                          width: 16.0), // Space between image and text

                      // Product Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product Name
                            Text(
                              '${order.product.productName}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap:
                                  true, // Ensure the text wraps instead of being truncated
                            ),
                            const SizedBox(height: 4.0),
                            // Username
                            if (role == "buyer")
                              Text(
                                "User: ${order.product.sellerUsername}",
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: gray,
                                ),
                                softWrap:
                                    true, // Ensure the text wraps instead of being truncated
                              )
                            else if (role == "seller")
                              Text(
                                "User: ${order.buyerUsername}",
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: gray,
                                ),
                                softWrap:
                                    true, // Ensure the text wraps instead of being truncated
                              ),
                            const SizedBox(height: 4.0),
                            // Price
                            Text(
                              "${order.totalAmount}",
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: black,
                              ),
                              softWrap:
                                  true, // Ensure the text wraps instead of being truncated
                            ),
                          ],
                        ),
                      ),

                      // Order Status
                      Text(
                        order.currentStatus,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: green600,
                        ),
                        softWrap:
                            true, // Ensure the text wraps instead of being truncated
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
  }
}
