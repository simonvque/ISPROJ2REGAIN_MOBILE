import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/features/screens/qr_payment/payment_details_page.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/model/payment_model.dart';
import 'package:regain_mobile/model/viewoffers_model.dart';
import 'package:regain_mobile/nav.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/order_provider.dart';

import '../../../themes/elements/button_styles.dart';

class Checkout extends StatefulWidget {
  final ViewOffersModel offer;

  const Checkout({
    super.key,
    required this.offer,
  });

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final _checkoutOrderKey = GlobalKey<FormState>();

  late bool _enableSellerDropOff;

  String? _paymentMethod = 'Cash on Delivery';
  String? _deliveryMethod = 'Buyer Pick-up';
  DateTime _dateTimeNow = DateTime.now();
  late DateTime _selectedDateTime;

  late DateTime maxTime;

  late int userId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _enableSellerDropOff = widget.offer.product.canDeliver;
    _selectedDateTime = _dateTimeNow.add(const Duration(milliseconds: 30));
    maxTime = _dateTimeNow.add(const Duration(days: 1095));

    userId = Provider.of<AppDataProvider>(context, listen: false).userId;
  }

  void _submitOrderCheckout() {
    String _status = "To Ship";
    // if (_deliveryMethod == "Cash on Delivery") {
    //   _status = "To Ship";
    // } else if (_deliveryMethod) {

    // }
    final payment = PaymentModel(
      paymentType: _deliveryMethod!,
      amountPaid: widget.offer.offerValue,
    );

    final orderModel = OrderModel(
        productID: widget.offer.product.productID,
        buyerID: userId,
        deliveryMethod: _deliveryMethod!,
        deliveryDate: _selectedDateTime,
        paymentMethod: payment,
        totalAmount: widget.offer.offerValue,
        currentStatus: _status);
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(CupertinoIcons.arrow_left, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Checkout',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat-Bold',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //ORDER DETAILS
              Form(
                key: _checkoutOrderKey,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order Details',
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/homepage/plastic.png', // Replace with your image asset
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Item Name: ${widget.offer.product.productName}',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Location: ${widget.offer.product.location}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Weight: ${widget.offer.product.weight}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                      'Total Price: P${widget.offer.offerValue}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //PAYEMENT DETAILS
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Payment Details',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headlineSmall),
                      Row(
                        children: [
                          Radio(
                            value: 'Cash on Delivery',
                            groupValue: _paymentMethod,
                            activeColor: const Color(0xFF12CF8A),
                            onChanged: (value) {
                              setState(() {
                                _paymentMethod = value.toString();
                              });
                            },
                          ),
                          Text('Cash on Delivery',
                              style: Theme.of(context).textTheme.bodyMedium),
                          Radio(
                            value: 'GCash',
                            groupValue: _paymentMethod,
                            activeColor: const Color(0xFF12CF8A),
                            onChanged: (value) {
                              setState(() {
                                _paymentMethod = value.toString();
                              });
                            },
                          ),
                          Text('GCash',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //SHIPPING DETAILS
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shipping Details',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 10),
                      Text(' Delivery method',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium),
                      Row(
                        children: [
                          Radio(
                            value: 'Buyer Pick-up',
                            groupValue: _deliveryMethod,
                            activeColor: const Color(0xFF12CF8A),
                            onChanged: (value) {
                              setState(() {
                                _deliveryMethod = value.toString();
                              });
                            },
                          ),
                          Text('Buyer Pick-Up',
                              style: Theme.of(context).textTheme.bodyMedium),
                          if (_enableSellerDropOff)
                            Radio(
                              value: 'Seller Drop-off',
                              groupValue: _deliveryMethod,
                              activeColor: const Color(0xFF12CF8A),
                              onChanged: (value) {
                                setState(() {
                                  _deliveryMethod = value.toString();
                                });
                              },
                            ),
                          if (_enableSellerDropOff)
                            Text('Seller Drop-off',
                                style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(' Preferred Delivery Date',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium),
                      GestureDetector(
                        onTap: _showDatePicker,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          margin: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${_selectedDateTime.month}/${_selectedDateTime.day}/${_selectedDateTime.year}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const Icon(CupertinoIcons.calendar),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 120),
              //CONFIRM BUTTON
              RegainButtons(
                text: 'Confirm Order',
                onPressed: () {
                  // Add your confirmation logic here
                  _submitOrderCheckout();
                },
                type: ButtonType.filled,
                size: ButtonSize.large,
              ),
            ],
          ),
        ),
      ),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(color: Color(0xFF12CF8A)),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  //CUPERTINO DATE PICKER
  Future<void> _showDatePicker() async {
    final selectedDate = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          color: Colors.white,
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoTheme(
            data: const CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Montserrat-Medium',
                  color: Colors.black,
                ),
              ),
            ),
            child: CupertinoDatePicker(
              minimumDate: _dateTimeNow,
              maximumDate: maxTime,
              backgroundColor: Colors.white,
              initialDateTime: _dateTimeNow,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime newDate) {
                setState(() {
                  _selectedDateTime = newDate;
                });
              },
            ),
          ),
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDateTime = selectedDate;
      });
    }
  }
}
