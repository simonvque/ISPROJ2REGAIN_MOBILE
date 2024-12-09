import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/model/payment_model.dart';
import 'package:regain_mobile/nav.dart';
import 'package:regain_mobile/provider/order_provider.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class PaymentDetailsPage extends StatefulWidget {
  final OrderModel order;

  const PaymentDetailsPage({
    super.key,
    required this.order,
  });

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  final _gCashKey = GlobalKey<FormState>();

  final _referenceController = TextEditingController();
  final _amountPaidController = TextEditingController();

  void _submitOrder() {
    //final orderModel = widget.order;
    if (_gCashKey.currentState!.validate()) {
      final payment = PaymentModel(
        paymentType: widget.order.paymentMethod!.paymentType,
        amountPaid: _amountPaidController.text,
        referenceNumber: _referenceController.text,
        status: "Pending",
      );

      final orderModel = OrderModel(
          product: widget.order.product,
          buyerUsername: widget.order.buyerUsername,
          deliveryMethod: widget.order.deliveryMethod,
          deliveryDate: widget.order.deliveryDate,
          paymentMethod: payment,
          totalAmount: widget.order.totalAmount,
          currentStatus: widget.order.currentStatus,
          address: widget.order.address);

      // orderModel = OrderModel(
      //   product: widget.offer.product,
      //   buyerUsername: user!.username,
      //   deliveryMethod: _deliveryMethod!,
      //   deliveryDate: _selectedDateTime,
      //   paymentMethod: payment,
      //   totalAmount: widget.offer.offerValue,
      //   currentStatus: _status);

      Provider.of<OrderProvider>(context, listen: false)
          .addOrder(orderModel)
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NavigationMenu()), // Replace with your home page
            (route) => false,
          );
          ReGainHelperFunctions.showSnackBar(context, "Order has been placed");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth > 600 ? 40 : 16;
    double iconSize = screenWidth > 600 ? 60 : 40;
    double fontSize = screenWidth > 600 ? 24 : 20;

    return Scaffold(
      appBar: buildAppBar(
        context,
        'QR Payment Details',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Form(
          key: _gCashKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.qr_code_scanner_rounded,
                    size: iconSize,
                    color: green,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ReGainTexts.qrTitle2,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ReGainTexts.qrMsg2,
                          style: TextStyle(
                            fontSize: fontSize - 4,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: ReGainSizes.spaceBtwSections,
              ),
              const Text(
                'Reference Number:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _referenceController,
                decoration: const InputDecoration(
                  hintText: 'Enter the Reference Number',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: green),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid reference number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Amount Paid:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _amountPaidController,
                decoration: const InputDecoration(
                  hintText: 'Enter the amount you paid',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: green),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: ReGainSizes.spaceBtwSections,
              ),
              RegainButtons(
                text: 'Confirm Payment',
                onPressed: () {
                  //where to redirect
                  _submitOrder();
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => NavigationMenu(),
                  //   ),
                  // );
                },
                type: ButtonType.filled,
                txtSize: BtnTxtSize.large,
                size: ButtonSize.large,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
