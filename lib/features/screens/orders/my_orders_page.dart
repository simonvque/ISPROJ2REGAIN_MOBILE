import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/orders/order_log_page.dart';
import 'package:regain_mobile/features/screens/orders/order_tile/buyer_order_tile.dart';
import 'package:regain_mobile/features/screens/orders/order_tile/seller_order_tile.dart';
import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/order_provider.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  _OrderTrackingPageState createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  String _selectedRole = 'As Buyer'; // Default selection

  String methodOne = "Seller Drop-off";
  String methodTwo = "Buyer Pick-up";

  late int userId;

  late List<OrderModel> orders = [];
  late List<OrderModel> orders2 = [];

  //temporary data
  //view temp_orderprod.dart for temporary class
  // final List<OrderProduct> orders = [
  //   OrderProduct(
  //     sellerUsername: 'seller123',
  //     buyerUsername: 'buyer123',
  //     productName: 'Product 1',
  //     price: '500',
  //     location: 'Makati City',
  //     isForDelivery: true,
  //     deliveryDate: '2024-08-01',
  //     paymentMode: 'Cash on Delivery',
  //     statusList: [OrderStatus.pending], // Initialize with 'pending' status
  //   ),
  //   OrderProduct(
  //     sellerUsername: 'seller123',
  //     buyerUsername: 'buyer123',
  //     productName: 'Product 2',
  //     price: '1000',
  //     location: 'Quezon City',
  //     isForDelivery: false,
  //     deliveryDate: '2024-08-02',
  //     paymentMode: 'Bank Transfer',
  //     statusList: [OrderStatus.pending],
  //   ),
  // ];

  @override
  void initState() {
    // TODO: implement initState
    _fetchData();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _fetchData();
    super.didChangeDependencies();
  }

  void _fetchData() async {
    userId = Provider.of<AppDataProvider>(context, listen: false).userId;

    //String method;

    // if (isDelivery) {
    //   method = methodOne;
    // } else {
    //   method = methodTwo;
    // }

    orders = await Provider.of<OrderProvider>(context, listen: false)
        .getOrdersByDeliveryBuyer(methodOne, userId);

    orders2 = await Provider.of<OrderProvider>(context, listen: false)
        .getOrdersByPickupBuyer(methodTwo, userId);

    // if (_selectedRole == 'As Buyer') {
    //   orders = await Provider.of<OrderProvider>(context, listen: false)
    //       .getOrdersByDeliveryBuyer(methodOne, userId);
    // } else if (_selectedRole == 'As Seller') {
    //   orders = await Provider.of<OrderProvider>(context, listen: false)
    //       .getOrdersByDeliverSeller(methodTwo, userId);
    // }
  }

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
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: DropdownButton<String>(
            //     value: _selectedRole,
            //     items: <String>['As Buyer', 'As Seller']
            //         .map<DropdownMenuItem<String>>((String value) {
            //       return DropdownMenuItem<String>(
            //         value: value,
            //         child: Text(value),
            //       );
            //     }).toList(),
            //     onChanged: (String? newValue) {
            //       setState(() {
            //         _selectedRole = newValue!;
            //       });
            //     },
            //   ),
            // ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildOrderList(context),
                  _buildOrderList2(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// for pickup
  Widget _buildOrderList2(BuildContext context) {
    return ListView.builder(
      itemCount: orders2.length,
      itemBuilder: (context, index) {
        final order = orders2[index];
        return GestureDetector(
          onTap: () {
            // Navigate to order log page
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => OrderLogPage(order: order),
            //   ),
            // );
          },
          child: BuyerOrderTile(
            order: order,
          ),
        );
      },
    );
  }

//for delivery
  Widget _buildOrderList(BuildContext context) {
    // List<OrderProduct> filteredOrders =
    //     orders.where((order) => order.isForDelivery == isDelivery).toList();

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return GestureDetector(
          // onTap: () {
          //   // Navigate to order log page
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => OrderLogPage(order: order),
          //     ),
          //   );
          // },
          child: BuyerOrderTile(
            order: order,
          ),
        );
      },
    );
  }
}
