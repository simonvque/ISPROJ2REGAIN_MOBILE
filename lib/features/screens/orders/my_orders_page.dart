import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/orders/order_log_page.dart';
import 'package:regain_mobile/features/screens/orders/order_tile/buyer_order_tile.dart';
import 'package:regain_mobile/features/screens/orders/order_tile/seller_order_tile.dart';
import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  _OrderTrackingPageState createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  String _selectedRole = 'As Buyer'; // Default selection

  //temporary data
  //view temp_orderprod.dart for temporary class
  final List<OrderProduct> orders = [
    OrderProduct(
      sellerUsername: 'seller123',
      buyerUsername: 'buyer123',
      productName: 'Product 1',
      price: '500',
      location: 'Makati City',
      isForDelivery: true,
      deliveryDate: '2024-08-01',
      paymentMode: 'Cash on Delivery',
      statusList: [OrderStatus.pending], // Initialize with 'pending' status
    ),
    OrderProduct(
      sellerUsername: 'seller123',
      buyerUsername: 'buyer123',
      productName: 'Product 2',
      price: '1000',
      location: 'Quezon City',
      isForDelivery: false,
      deliveryDate: '2024-08-02',
      paymentMode: 'Bank Transfer',
      statusList: [OrderStatus.pending], 
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
              Tab(text: 'For delivery'),
              Tab(text: 'For pick up'),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: _selectedRole,
                items: <String>['As Buyer', 'As Seller']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRole = newValue!;
                  });
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildOrderList(context, true),
                  _buildOrderList(context, false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, bool isForDelivery) {
    List<OrderProduct> filteredOrders = orders
        .where((order) => order.isForDelivery == isForDelivery)
        .toList();

    return ListView.builder(
      itemCount: filteredOrders.length,
      itemBuilder: (context, index) {
        final order = filteredOrders[index];
        if (_selectedRole == 'As Buyer') {
          return GestureDetector(
            onTap: () {
              // Navigate to order log page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderLogPage(order: order),
                ),
              );
            },
            child: BuyerOrderTile(
              product: order,
              isForDelivery: isForDelivery,
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              // Navigate to order log page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderLogPage(order: order),
                ),
              );
            },
            child: SellerOrderTile(
              product: order,
              isForDelivery: isForDelivery,
            ),
          );
        }
      },
    );
  }
}
