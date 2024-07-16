import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/orders/order_log_page.dart';
import 'package:regain_mobile/features/screens/orders/temp_orderprod.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

//tile widget for buyer order
class BuyerOrderTile extends StatelessWidget {
  final OrderProduct product;
  final bool isForDelivery;

  const BuyerOrderTile({Key? key, required this.product, required this.isForDelivery}) : super(key: key);

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
              '@${product.sellerUsername}',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RegainButtons(
                    text: 'Cancel',
                    onPressed: () {
                      // Add logic to cancel the order
                    },
                    type: ButtonType.filled,
                    size: ButtonSize.xxs,
                    txtSize: BtnTxtSize.medium,
                    customColor: red,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.065),
                  RegainButtons(
                    text: 'Order Received',
                    onPressed: () {
                      // Add logic to confirm order received
                      product.statusList.add(OrderStatus.inProgress);
                    },
                    type: ButtonType.filled,
                    size: ButtonSize.xs,
                    txtSize: BtnTxtSize.small,
                  ),
                ],
              ),
            ] else ...[
              Align(
                alignment: Alignment.center,
                child: RegainButtons(
                  text: 'Order Picked Up',
                  onPressed: () {
                    // Add logic to confirm order picked up
                  },
                  type: ButtonType.filled,
                  size: ButtonSize.large,
                  txtSize: BtnTxtSize.large,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
