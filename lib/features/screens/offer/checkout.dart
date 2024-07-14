import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../themes/elements/button_styles.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String? _paymentMethod = 'cash_on_delivery';
  String? _deliveryMethod = 'buyer_pick_up';
  DateTime _selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(CupertinoIcons.arrow_left, color: Colors.white),
            onPressed: () {},
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
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Order Details',
                      style: Theme.of(context).textTheme.headlineMedium
                    ),
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
                                  'Item Name: Example Item',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Location: Example Location',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Weight: 2kg',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Total Price: \$50.00',
                                    style: Theme.of(context).textTheme.bodyLarge
                                ),
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
                      Text(
                        'Payment Details',
                        textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headlineSmall
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 'cash_on_delivery',
                            groupValue: _paymentMethod,
                            activeColor: const Color(0xFF12CF8A),
                            onChanged: (value) {
                              setState(() {
                                _paymentMethod = value.toString();
                              });
                            },
                          ),
                           Text(
                            'Cash on Delivery',
                              style: Theme.of(context).textTheme.bodyMedium
                          ),
                          Radio(
                            value: 'gcash',
                            groupValue: _paymentMethod,
                            activeColor: const Color(0xFF12CF8A),
                            onChanged: (value) {
                              setState(() {
                                _paymentMethod = value.toString();
                              });
                            },
                          ),
                           Text(
                            'GCash',
                              style: Theme.of(context).textTheme.bodyMedium
                          ),
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
                      Text(
                        'Shipping Details',
                        textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headlineSmall
                      ),
                      const SizedBox(height: 10),
                      Text(
                        ' Delivery method',
                        textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 'buyer_pick_up',
                            groupValue: _deliveryMethod,
                            activeColor: const Color(0xFF12CF8A),
                            onChanged: (value) {
                              setState(() {
                                _deliveryMethod = value.toString();
                              });
                            },
                          ),
                           Text(
                            'Buyer Pick-Up',
                            style: Theme.of(context).textTheme.bodyMedium
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        ' Preferred Delivery Date',
                        textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium
                      ),
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
              backgroundColor: Colors.white,
              initialDateTime: _selectedDateTime,
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
