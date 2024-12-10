import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/commissions_model.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/model/payment_model.dart';
import 'package:regain_mobile/nav.dart';
import 'package:regain_mobile/provider/commissions_provider.dart';
import 'package:regain_mobile/provider/order_provider.dart';
import 'package:regain_mobile/themes/app_bar.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class PaymentDetailsPage extends StatefulWidget {
  final OrderModel? order;
  final List<CommissionsModel>? commList;

  const PaymentDetailsPage({
    super.key,
    this.order,
    this.commList,
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
        paymentType: widget.order!.paymentMethod!.paymentType,
        amountPaid: _amountPaidController.text,
        referenceNumber: _referenceController.text,
        status: "Pending",
      );

      final orderModel = OrderModel(
          product: widget.order!.product,
          buyerUsername: widget.order!.buyerUsername,
          deliveryMethod: widget.order!.deliveryMethod,
          deliveryDate: widget.order!.deliveryDate,
          paymentMethod: payment,
          totalAmount: widget.order!.totalAmount,
          currentStatus: widget.order!.currentStatus,
          address: widget.order!.address);

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

  void _submitCommBalPayment() {
    if (_gCashKey.currentState!.validate()) {
      final payment = PaymentModel(
        amountPaid: _amountPaidController.text,
        referenceNumber: _referenceController.text,
        status: "Pending",
      );

      List<CommissionsModel> paymentList = [];
      widget.commList?.forEach((value) => paymentList.add(CommissionsModel(
          commissionID: value.commissionID,
          userID: value.userID,
          order: value.order,
          commissionBalance: value.commissionBalance,
          status: value.status,
          payment: payment)));

      Provider.of<CommissionsProvider>(context, listen: false)
          .addPayment(widget.commList!.first.userID, paymentList)
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NavigationMenu()), // Replace with your home page
            (route) => false,
          );
          ReGainHelperFunctions.showSnackBar(context, "Payment has been added");
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
                  if (widget.order != null && widget.commList == null) {
                    _submitOrder();
                  } else if (widget.order == null && widget.commList != null) {
                    _submitCommBalPayment();
                  }
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
