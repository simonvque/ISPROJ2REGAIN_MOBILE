import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/qr_payment/payment_details_page.dart';
import 'package:regain_mobile/features/screens/qr_payment/scan_qr_page.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/address_model.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/model/payment_model.dart';
import 'package:regain_mobile/model/user_model.dart';
import 'package:regain_mobile/model/viewoffers_model.dart';
import 'package:regain_mobile/nav.dart';
import 'package:regain_mobile/provider/address_data_provider.dart';
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
  late bool _enableGCash;

  String? _paymentMethod = 'Cash on Delivery';

  String? _deliveryMethod = 'Buyer Pick-up';
  DateTime _dateTimeNow = DateTime.now();
  late DateTime _selectedDateTime;
  AddressModel? _selectedLocation;

  late DateTime maxTime;

  late int userId;
  late UserModel? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _enableSellerDropOff = widget.offer.product.canDeliver;
    _selectedDateTime = _dateTimeNow.add(const Duration(milliseconds: 30));
    maxTime = _dateTimeNow.add(const Duration(days: 1095));

    user = Provider.of<AppDataProvider>(context, listen: false).user!;
    userId = Provider.of<AppDataProvider>(context, listen: false).userId;
    (user!.gcashQRcode == null)
        ? (_enableGCash = false)
        : (_enableGCash = true);
    Provider.of<AddressDataProvider>(context, listen: false)
        .getUserAddresses(userId);
  }

  void _submitOrderCheckout() {
    if (_checkoutOrderKey.currentState!.validate()) {
      String _status = "To Ship";

      final payment = PaymentModel(
        paymentType: _paymentMethod!,
        amountPaid: widget.offer.offerValue,
        status: "Pending",
      );

      final orderModel;
      if (_deliveryMethod == "Seller Drop-off") {
        orderModel = OrderModel(
            product: widget.offer.product,
            buyerUsername: user!.username,
            deliveryMethod: _deliveryMethod!,
            deliveryDate: _selectedDateTime,
            paymentMethod: payment,
            totalAmount: widget.offer.offerValue,
            currentStatus: _status,
            address: _selectedLocation!);
      } else {
        orderModel = OrderModel(
            product: widget.offer.product,
            buyerUsername: user!.username,
            deliveryMethod: _deliveryMethod!,
            deliveryDate: _selectedDateTime,
            paymentMethod: payment,
            totalAmount: widget.offer.offerValue,
            currentStatus: _status);
      }

      if (_paymentMethod == "Cash on Delivery") {
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
            ReGainHelperFunctions.showSnackBar(
                context, "Order has been placed");
          }
        });
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => ScanQRPage(
                      order: orderModel,
                    )),
            (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
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
        child: Form(
          key: _checkoutOrderKey,
          child: Column(
            children: [
              //ORDER DETAILS
              Container(
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
                          // Product Image Section
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.grey.shade200,
                              image: widget.offer.product.image != null &&
                                      widget.offer.product.image!.isNotEmpty
                                  ? DecorationImage(
                                      image: MemoryImage(base64Decode(
                                          widget.offer.product.image!)),
                                      fit: BoxFit.cover,
                                    )
                                  : const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/homepage/plastic.png'), // Placeholder asset
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Item Name: ${widget.offer.product.productName}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Location: ${widget.offer.product.location}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Weight: ${widget.offer.product.weight}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 5),
                                Text('Total Price: P${widget.offer.offerValue}',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                        key: GlobalKey(),
                        children: [
                          Radio(
                            value: 'Cash on Delivery',
                            groupValue: _paymentMethod,
                            activeColor: const Color(0xFF12CF8A),
                            onChanged: (valuePayment) {
                              setState(() {
                                _paymentMethod = valuePayment;
                              });
                            },
                          ),
                          Text('Cash on Delivery',
                              style: Theme.of(context).textTheme.bodyMedium),
                          if (_enableGCash)
                            Radio(
                              value: 'GCash',
                              groupValue: _paymentMethod,
                              activeColor: const Color(0xFF12CF8A),
                              onChanged: (valuePayment) {
                                setState(() {
                                  _paymentMethod = valuePayment;
                                });
                              },
                            ),
                          if (_enableGCash)
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
                    children: <Widget>[
                      Text('Shipping Details',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 10),
                      Text(' Delivery method',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium),
                      Row(
                        key: GlobalKey(),
                        children: [
                          Radio(
                            value: 'Buyer Pick-up',
                            groupValue: _deliveryMethod,
                            activeColor: const Color(0xFF12CF8A),
                            onChanged: (valueDel) {
                              setState(() {
                                _deliveryMethod = valueDel;
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
                              onChanged: (valueDel) {
                                setState(() {
                                  _deliveryMethod = valueDel;
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
                      ),

                      // dropdown buyer's address if seller drop-off is chosen
                      if (_deliveryMethod == "Seller Drop-off")
                        Container(
                          child: Consumer<AddressDataProvider>(
                            builder: (context, value, child) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12.0),
                              child: DropdownButtonFormField<AddressModel>(
                                value: _selectedLocation,
                                decoration: InputDecoration(
                                  hintText: 'Location',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                ),
                                items: value.userAddress.map((address) {
                                  return DropdownMenuItem<AddressModel>(
                                    value: address,
                                    child: Text(
                                        '${address.city} - ${address.street}'),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedLocation = value;
                                  });
                                },
                                validator: (value) {
                                  if (_deliveryMethod == "Seller Drop-off" &&
                                      value == null) {
                                    return 'Please select a valid location';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
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
