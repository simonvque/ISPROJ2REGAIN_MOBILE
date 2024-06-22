import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../selected_item.dart';

// class CardItems extends StatelessWidget {
//   final List<Map<String, dynamic>> items;
//
//   const CardItems({
//     required this.items,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: items.length,
//       shrinkWrap: true,
//       padding: EdgeInsets.zero,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 8.0,
//         crossAxisSpacing: 8.0,
//         childAspectRatio: MediaQuery.of(context).size.width /
//             (MediaQuery.of(context).size.height * 0.7),
//       ),
//       itemBuilder: (context, index) {
//         final Map<String, dynamic> item = items[index];
//         final bool isSellerDropOff = item['isSellerDropOff'];
//         return Card(
//           child: InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SelectedItemScreen()),
//               );
//             },
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Stack(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: 100,
//                       child: Image.asset(
//                         item['imagePath'],
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           item['title'],
//                           style: TextStyle(
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           Icons.favorite_border,
//                           color: Colors.black,
//                         ),
//                         onPressed: () {
//                           // -------------------- GO TO FAVORITES --------------------
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.location_on,
//                         color: Colors.grey,
//                         size: 16,
//                       ),
//                       SizedBox(width: 4),
//                       Text(
//                         item['location'],
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     item['price'],
//                     style: TextStyle(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 6.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             width: 24, // adjust size as needed
//                             height: 24, // adjust size as needed
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.black, // fallback color
//                             ),
//                             child: item['sellerImagePath'] != null
//                                 ? ClipOval(
//                               child: Image.asset(
//                                 item['sellerImagePath'],
//                                 width: 24,
//                                 height: 24,
//                                 fit: BoxFit.cover,
//                               ),
//                             )
//                                 : Icon(
//                               Icons.person,
//                               color: Colors.white,
//                               size: 16,
//                             ),
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             item['seller'],
//                             style: TextStyle(
//                               fontSize: 12.0,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         item['weight'],
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 6.0, right: 8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             isSellerDropOff ? Icons.check_circle : Icons.cancel,
//                             color: isSellerDropOff ? Colors.green : Colors.red,
//                             size: 24,
//                           ),
//                           SizedBox(width: 6),
//                           Text(
//                             'Seller drop-off',
//                             style: TextStyle(
//                               fontSize: 12.0,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         item['category'],
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

class CardItems extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const CardItems({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height * 0.7),
      ),
      itemBuilder: (context, index) {
        final Map<String, dynamic> item = items[index];
        final bool isSellerDropOff = item['isSellerDropOff'];
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelectedItemScreen()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      child: Image.asset(
                        item['imagePath'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item['title'],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // -------------------- GO TO FAVORITES --------------------
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        item['location'],
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item['price'],
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24, // adjust size as needed
                            height: 24, // adjust size as needed
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black, // fallback color
                            ),
                            child: item['sellerImagePath'] != null
                                ? ClipOval(
                              child: Image.asset(
                                item['sellerImagePath'],
                                width: 24,
                                height: 24,
                                fit: BoxFit.cover,
                              ),
                            )
                                : Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            item['seller'],
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        item['weight'],
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            isSellerDropOff ? Icons.check_circle : Icons.cancel,
                            color: isSellerDropOff ? Colors.green : Colors.red,
                            size: 24,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Seller drop-off',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        item['category'],
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

