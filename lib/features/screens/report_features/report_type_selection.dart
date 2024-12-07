// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:regain_mobile/themes/elements/button_styles.dart';
// import 'report_page.dart';
// import 'package:regain_mobile/datasource/app_data_source.dart';

// class ReportTypeSelectionPage extends StatelessWidget {
//   final dataSource = AppDataSource();
//   final String ipAddress =
//       AppDataSource().ipAddPort; // Ensure correct IP retrieval

//   final dynamic item;
//   final int reporterID;

//   ReportTypeSelectionPage({
//     super.key,
//     required this.item,
//     required this.reporterID,
//   });

//   void navigateToReportPage(BuildContext context, String reportType) async {
//     int reportedListingID;

//     if (reportType == 'product') {
//       // Use the product ID for product reports
//       reportedListingID = item.productID;
//     } else {
//       // Fetch the seller's user ID dynamically for user reports
//       try {
//         final sellerId =
//             await _fetchSellerIdByUsername(item.sellerUsername, ipAddress);
//         reportedListingID = sellerId;
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to fetch seller ID: $e')),
//         );
//         return; // Exit the function if fetching seller ID fails
//       }
//     }

//     // Navigate to the ReportPage
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => ReportPage(
//           productName: reportType == 'product' ? item.productName : '',
//           sellerUsername: item.sellerUsername,
//           productCategory: reportType == 'product' ? item.category : '',
//           productPrice: reportType == 'product' ? item.price.toString() : '',
//           reporterID: reporterID,
//           reportedListingID: reportedListingID,
//           reportType: reportType, // Pass the reportType
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Select Report Type')),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'What are you reporting?',
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             const SizedBox(height: 20),
//             RegainButtons(
//               onPressed: () => navigateToReportPage(context, 'product'),
//               text: 'I’m reporting the product',
//               type: ButtonType.outlined,
//               size: ButtonSize.large,
//               txtSize: BtnTxtSize.large,
//               rightIcon: CupertinoIcons.chevron_forward,
//             ),
//             const SizedBox(height: 12),
//             RegainButtons(
//               onPressed: () => navigateToReportPage(context, 'user'),
//               text: 'I’m reporting the user',
//               type: ButtonType.outlined,
//               size: ButtonSize.large,
//               txtSize: BtnTxtSize.large,
//               rightIcon: CupertinoIcons.chevron_forward,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<int> _fetchSellerIdByUsername(String username, String ipAdd) async {
//   final url = Uri.parse('http://$ipAdd/api/user/seller/by-username/$username');

//   try {
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final sellerData = jsonDecode(response.body);
//       print(
//           'Response Data: $sellerData'); // Log the entire response body for debugging

//       if (sellerData != null && sellerData['response'] != null) {
//         return sellerData[
//             'response']; // Ensure 'response' key exists and is not null
//       } else {
//         throw Exception('Seller ID not found in response');
//       }
//     } else {
//       print('Error: ${response.statusCode}');
//       print('Response Body: ${response.body}');
//       throw Exception(
//           'Failed to fetch seller ID, status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Exception: $e');
//     throw Exception('Error fetching seller ID: $e');
//   }
// }
