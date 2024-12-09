// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:regain_mobile/constants/colors.dart';
// import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart';

// //overall widget of the status
// class StatusTimeline extends StatelessWidget {
//   final OrderProduct order;

//   const StatusTimeline({super.key, required this.order});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: order.statusList.asMap().entries.map((entry) {
//         final index = entry.key;
//         final statusItem = entry.value;
//         return StatusItem(
//           status: statusItem.toString().split('.').last,
//           timestamp:
//               DateTime.now(), // Replace with actual timestamp from statusItem
//           isCurrent: index == 0, // Determine if it's the current status
//         );
//       }).toList(),
//     );
//   }
// }

// //for each status
// class StatusItem extends StatelessWidget {
//   final String status;
//   final DateTime timestamp;
//   final bool isCurrent;

//   const StatusItem({
//     Key? key,
//     required this.status,
//     required this.timestamp,
//     required this.isCurrent,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Container(
//             width: 10,
//             height: 10,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: isCurrent ? green : gray.withOpacity(0.5),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Text(
//             status,
//             style: TextStyle(
//               fontSize: 16,
//               color: isCurrent ? black : gray.withOpacity(0.5),
//             ),
//           ),
//           const Spacer(),
//           Text(
//             DateFormat('dd/MM/yyyy').format(timestamp), // Format the timestamp
//             style: Theme.of(context).textTheme.labelMedium,
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:regain_mobile/constants/colors.dart';
// import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart'; // Assuming this is correct

// // Updated StatusTimeline to handle OrderProduct and OrderStatus
// class StatusTimeline extends StatelessWidget {
//   final OrderProduct order;

//   const StatusTimeline({super.key, required this.order});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: order.statusList.asMap().entries.map((entry) {
//         final index = entry.key;
//         final statusItem = entry.value;
//         return StatusItem(
//           status: statusItem.displayName, // Use the displayName getter from the extension
//           timestamp: DateTime.now(), // Temporary timestamp
//           isCurrent: index == 0, // Determine if it's the current status
//         );
//       }).toList(),
//     );
//   }
// }

// // Widget for each status in the timeline
// class StatusItem extends StatelessWidget {
//   final String status;
//   final DateTime timestamp;
//   final bool isCurrent;

//   const StatusItem({
//     Key? key,
//     required this.status,
//     required this.timestamp,
//     required this.isCurrent,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Container(
//             width: 10,
//             height: 10,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: isCurrent ? green : gray.withOpacity(0.5),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Text(
//             status,
//             style: TextStyle(
//               fontSize: 16,
//               color: isCurrent ? black : gray.withOpacity(0.5),
//             ),
//           ),
//           const Spacer(),
//           Text(
//             DateFormat('dd/MM/yyyy').format(timestamp), // Format the timestamp
//             style: Theme.of(context).textTheme.labelMedium,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart';
import 'package:regain_mobile/model/order_log.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/order_provider.dart';

class StatusTimeline extends StatefulWidget {
  final OrderModel order;
  final String currentStatus;
  //final OrderModel orderModel;

  const StatusTimeline({
    super.key,
    required this.order,
    required this.currentStatus,
    //required this.orderModel,
  });

  @override
  State<StatusTimeline> createState() => _StatusTimelineState();
}

class _StatusTimelineState extends State<StatusTimeline> {
  late String currentStatus;
  List<Map<String, String>> finalLog = [];

  @override
  void initState() {
    // TODO: implement initState
    currentStatus = widget.order.currentStatus;
    super.initState();
  }

  // @override
  // void didUpdateWidget(covariant StatusTimeline oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   if (oldWidget.currentStatus != widget.currentStatus) {
  //     currentStatus = widget.currentStatus;
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    finalLog = [];
    _fetchData();
    currentStatus = widget.currentStatus;
    super.didChangeDependencies();
  }

  void _fetchData() async {
    //final userId = Provider.of<AppDataProvider>(context, listen: false).userId;
    final List<OrderLog> logList =
        await Provider.of<OrderProvider>(context, listen: true)
            .getOrderLogs(widget.order.orderID!);

    var initialDetail = {
      'status': 'To Ship',
      'timestamp': '${widget.order.orderDate}'
    };

    for (int x = 0; x < logList.length; x++) {
      int oneLess = x - 1;
      if (x == 0) {
        finalLog.add(initialDetail);
      } else {
        var detail = {
          'status': '${logList[x].prevStatus}',
          'timestamp': '${logList[oneLess].timeStamp}'
        };
        finalLog.add(detail);
      }
    }

    if (logList.isNotEmpty && logList.last.prevStatus != currentStatus) {
      String last = logList.last.timeStamp.toString();
      var lastItem = {'status': currentStatus, 'timestamp': '${last}'};
      finalLog.add(lastItem);
    } else {
      finalLog.add(initialDetail);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final currentStatus = widget.order.currentStatus;
    //final logs = Provider.of<OrderProvider>(context, listen: true).orderLogs;
    //debugPrint('logs ' + logs.toString());
    //debugPrint('fetchData ' + finalLog.toString());

    // final OrderProduct mockOrderProduct = OrderProduct(
    //   sellerUsername: "seller123",
    //   buyerUsername: "buyer123",
    //   productName: "Product 1",
    //   price: "150.00",
    //   location: "Barangay XYZ, Manila",
    //   isForDelivery: true,
    //   deliveryDate: "2024-11-30",
    //   paymentMode: "Cash on Delivery",
    //   statusList: [
    //     OrderStatus.toShip,
    //     OrderStatus.inTransit,
    //     OrderStatus.delivered,
    //     OrderStatus.received,
    //     OrderStatus.cancelled,
    //   ], // Mock status list
    // );

    //finalLog.add(initialDetail);

    // order
    // 0 to ship - orderdate
    // 1 in transit - toship date
    // 2 delivered - intransit date
    // 3 received - delivered date

    // current: in transit, previous: to ship, timestamp 0
    // current: delivered, previous: in transit, timestamp 1
    // current: received, previous: delivered, timestamp 2

    // logs.forEach((log){
    // });
    return Column(
      children: finalLog.asMap().entries.map((entry) {
        //final index = entry.key;
        final Map<String, String> pair = entry.value;
        bool current = false;
        if (currentStatus == pair['status']) {
          setState(() {
            current = true;
          });
        }
        String status;
        // if (index == 0) {
        //   status = "To Ship";
        // } else {
        //   status = statusItem.prevStatus;
        // }
        return StatusItem(
          status: pair['status']!,
          // Use the displayName getter from the extension
          timestamp: DateTime.parse(pair['timestamp']!), // Temporary timestamp
          isCurrent: current,
          // Determine if it's the current status i
        );
      }).toList(growable: true),
    );
  }
}

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
            DateFormat('MM/dd/yyyy').format(timestamp),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
