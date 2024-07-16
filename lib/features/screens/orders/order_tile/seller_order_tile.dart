import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/orders/order_log_page.dart';
import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

//tile widget for seller order
class SellerOrderTile extends StatelessWidget {
  final OrderProduct product;
  final bool isForDelivery;

  const SellerOrderTile({Key? key, required this.product, required this.isForDelivery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to order details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderLogPage(order: product,),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(bottom: BorderSide(color: gray, width: 1.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '@${product.buyerUsername}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            Text(
              product.productName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              product.location,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'PHP ${product.price}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 16),
            if (isForDelivery) ...[
              Align(
                alignment: Alignment.center,
                child: RegainButtons(
                  text: 'Ship Order',
                  onPressed: () {
                    // Add logic for Ship Order
                  },
                  type: ButtonType.filled,
                  size: ButtonSize.large,
                  txtSize: BtnTxtSize.large,
                ),
              ),
            ] else ...[ ],
          ],
        ),
      ),
    );
  }
}
