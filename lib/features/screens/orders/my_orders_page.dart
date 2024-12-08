// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // Import for date formatting
// import 'package:provider/provider.dart';
// import 'package:regain_mobile/constants/colors.dart';
// import 'package:regain_mobile/features/screens/orders/order_log_page.dart';
// import 'package:regain_mobile/features/screens/orders/order_tile/buyer_order_tile.dart';
// import 'package:regain_mobile/features/screens/orders/order_tile/seller_order_tile.dart';
// import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart';
// import 'package:regain_mobile/themes/app_bar.dart';
// import 'package:regain_mobile/model/order_model.dart';
// import 'package:regain_mobile/provider/app_data_provider.dart';
// import 'package:regain_mobile/provider/order_provider.dart';

// class OrderTrackingPage extends StatefulWidget {
//   const OrderTrackingPage({Key? key}) : super(key: key);

//   @override
//   _OrderTrackingPageState createState() => _OrderTrackingPageState();
// }

// class _OrderTrackingPageState extends State<OrderTrackingPage> {
//   String _selectedRole = 'As Buyer'; // Default selection

//   String methodOne = "Seller Drop-off";
//   String methodTwo = "Buyer Pick-up";

//   late int userId;

//   late List<OrderModel> orders = [];
//   late List<OrderModel> orders2 = [];

//   //temporary data
//   //view temp_orderprod.dart for temporary class
//   // final List<OrderProduct> orders = [
//   //   OrderProduct(
//   //     sellerUsername: 'seller123',
//   //     buyerUsername: 'buyer123',
//   //     productName: 'Product 1',
//   //     price: '500',
//   //     location: 'Makati City',
//   //     isForDelivery: true,
//   //     deliveryDate: '2024-08-01',
//   //     paymentMode: 'Cash on Delivery',
//   //     statusList: [OrderStatus.pending], // Initialize with 'pending' status
//   //   ),
//   //   OrderProduct(
//   //     sellerUsername: 'seller123',
//   //     buyerUsername: 'buyer123',
//   //     productName: 'Product 2',
//   //     price: '1000',
//   //     location: 'Quezon City',
//   //     isForDelivery: false,
//   //     deliveryDate: '2024-08-02',
//   //     paymentMode: 'Bank Transfer',
//   //     statusList: [OrderStatus.pending],
//   //   ),
//   // ];

//   @override
//   void initState() {
//     // TODO: implement initState
//     _fetchData();

//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     _fetchData();
//     super.didChangeDependencies();
//   }

//   void _fetchData() async {
//     userId = Provider.of<AppDataProvider>(context, listen: false).userId;

//     //String method;

//     // if (isDelivery) {
//     //   method = methodOne;
//     // } else {
//     //   method = methodTwo;
//     // }

//     // orders = await Provider.of<OrderProvider>(context, listen: false)
//     //     .getOrdersByDeliveryBuyer(methodOne, userId);

//     // orders2 = await Provider.of<OrderProvider>(context, listen: false)
//     //     .getOrdersByPickupBuyer(methodTwo, userId);

//     // if (_selectedRole == 'As Buyer') {
//     //   orders = await Provider.of<OrderProvider>(context, listen: false)
//     //       .getOrdersByDeliveryBuyer(methodOne, userId);
//     // } else if (_selectedRole == 'As Seller') {
//     //   orders = await Provider.of<OrderProvider>(context, listen: false)
//     //       .getOrdersByDeliverSeller(methodTwo, userId);
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: buildAppBar(
//           context,
//           'My Orders',
//           tabBar: TabBar(
//             unselectedLabelColor: white,
//             indicatorWeight: 4.0,
//             labelStyle: Theme.of(context).textTheme.titleMedium,
//             tabs: const [
//               Tab(text: 'For delivery'),
//               Tab(text: 'For pick up'),
//             ],
//           ),
//         ),
//         body: Column(
//           children: [
//             // Padding(
//             //   padding: const EdgeInsets.all(8.0),
//             //   child: DropdownButton<String>(
//             //     value: _selectedRole,
//             //     items: <String>['As Buyer', 'As Seller']
//             //         .map<DropdownMenuItem<String>>((String value) {
//             //       return DropdownMenuItem<String>(
//             //         value: value,
//             //         child: Text(value),
//             //       );
//             //     }).toList(),
//             //     onChanged: (String? newValue) {
//             //       setState(() {
//             //         _selectedRole = newValue!;
//             //       });
//             //     },
//             //   ),
//             // ),
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   _buildOrderList(context),
//                   _buildOrderList2(context),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// // for pickup
//   Widget _buildOrderList2(BuildContext context) {
//     return ListView.builder(
//       itemCount: orders2.length,
//       itemBuilder: (context, index) {
//         final order = orders2[index];
//         return GestureDetector(
//           onTap: () {
//             // Navigate to order log page
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) => OrderLogPage(order: order),
//             //   ),
//             // );
//           },
//           child: BuyerOrderTile(
//             order: order,
//           ),
//         );
//       },
//     );
//   }

// //for delivery
//   Widget _buildOrderList(BuildContext context) {
//     // List<OrderProduct> filteredOrders =
//     //     orders.where((order) => order.isForDelivery == isDelivery).toList();

//     return ListView.builder(
//       itemCount: orders.length,
//       itemBuilder: (context, index) {
//         final order = orders[index];
//         return GestureDetector(
//           // onTap: () {
//           //   // Navigate to order log page
//           //   Navigator.push(
//           //     context,
//           //     MaterialPageRoute(
//           //       builder: (context) => OrderLogPage(order: order),
//           //     ),
//           //   );
//           // },
//           child: BuyerOrderTile(
//             order: order,
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:regain_mobile/constants/colors.dart';
// import 'package:regain_mobile/themes/app_bar.dart';

// class OrderTrackingPage extends StatefulWidget {
//   const OrderTrackingPage({Key? key}) : super(key: key);

//   @override
//   _OrderTrackingPageState createState() => _OrderTrackingPageState();
// }

// class _OrderTrackingPageState extends State<OrderTrackingPage> {
//   // Temporary data for UI demo (with status field for dynamic updates)
//   List<Map<String, String>> buyerOrders = [
//     {"id": "1", "productName": "Product 1", "username": "seller123", "status": "To Ship"},
//     {"id": "2", "productName": "Product 2", "username": "seller456", "status": "To Ship"},
//   ];

//   List<Map<String, String>> sellerOrders = [
//     {"id": "3", "productName": "Product A", "username": "buyer123", "status": "To Ship"},
//     {"id": "4", "productName": "Product B", "username": "buyer456", "status": "To Ship"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//       appBar: buildAppBar(
//             context,
//             'My Orders',
//             tabBar: TabBar(
//               unselectedLabelColor: white,
//               indicatorWeight: 4.0,
//               labelStyle: Theme.of(context).textTheme.titleMedium,
//               tabs: const [
//                 Tab(text: 'As Buyer'),
//                 Tab(text: 'As Seller'),
//               ],
//           ),
//         ),        body: TabBarView(
//           children: [
//             _buildOrderList(buyerOrders),
//             _buildOrderList(sellerOrders),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildOrderList(List<Map<String, String>> orders) {
//     return ListView.builder(
//       itemCount: orders.length,
//       itemBuilder: (context, index) {
//         final order = orders[index];
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0), // Adjust spacing
//           child: InkWell(
//             onTap: () {
//               // Navigate to log page (placeholder for now)
//               debugPrint("Navigating to log page for Order ID: ${order["id"]}");
//             },
//             child: Padding(padding: const EdgeInsets.all(10.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Photo Box
//                 Container(
//                   width: 60,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade300,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: const Icon(Icons.image, color: Colors.grey), // Placeholder image
//                 ),
//                 const SizedBox(width: 16.0), // Space between image and text

//                 // Product Info
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         order["productName"]!,
//                         style: const TextStyle(
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 4.0),
//                       Text(
//                         "User: ${order["username"]!}",
//                         style: const TextStyle(
//                           fontSize: 14.0,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Order Status
//                 Text(
//                   order["status"]!,
//                   style: const TextStyle(
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.bold,
//                     color: green600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
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

  // // order id, Product product, sellerUsername, Order status, Order total amount
  // List<Map<String, String?>> buyerOrders = [
  //   {
  //     "id": "1",
  //     "productName": "Product 1",
  //     "username": "seller123",
  //     "status": "To Ship",
  //     "price": "Php 150"
  //   },
  //   {
  //     "id": "2",
  //     "productName": "Product 2",
  //     "username": "seller456",
  //     "status": "To Ship",
  //     "price": "Php 200"
  //   },
  // ];

  List<OrderModel> sellerOrders = [];

  // List<Map<String, String?>> sellerOrders = [
  //   // order id, Product product, sellerUsername, Order status, Order total amount
  //   {
  //     "id": "3",
  //     "productName": "Product A",
  //     "username": "buyer123",
  //     "status": "To Ship",
  //     "price": "Php 300"
  //   },
  //   {
  //     "id": "4",
  //     "productName": "Product B",
  //     "username": "buyer456",
  //     "status": "To Ship",
  //     "price": "Php 250"
  //   },
  // ];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   fetchData();
  //   super.initState();
  // }

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
                    // Photo Box
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Icon(Icons.image,
                          color: Colors.grey), // Placeholder image
                    ),
                    const SizedBox(width: 16.0), // Space between image and text

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
      );
    else
      return Consumer<OrderProvider>(
        builder: (context, provider, child) => Expanded(
          child: ListView.builder(
            itemCount: provider.ordersSeller!.length,
            itemBuilder: (context, index) {
              final order = provider.ordersSeller![index];
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
                        // Photo Box
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Icon(Icons.image,
                              color: Colors.grey), // Placeholder image
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
        ),
      );
  }
}
