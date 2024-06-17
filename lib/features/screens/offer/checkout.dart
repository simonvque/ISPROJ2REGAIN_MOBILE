import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String? _paymentMethod = 'cash_on_delivery';
  String? _deliveryMethod = 'buyer_pick_up';
  DateTime _selectedDateTime = DateTime.now();

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
                    const Text(
                      'Order Details',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Montserrat-Bold',
                      ),
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
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Item Name: Example Item',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Location: Example Location',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Weight: 2kg',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Total Price: \$50.00',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                      const Text(
                        'Payment Details',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Montserrat-Bold',
                        ),
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 'cash_on_delivery',
                            groupValue: _paymentMethod,
                            activeColor: Color(0xFF12CF8A),
                            onChanged: (value) {
                              setState(() {
                                _paymentMethod = value.toString();
                              });
                            },
                          ),
                          const Text(
                            'Cash on Delivery',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat-Regular',
                            ),
                          ),
                          Radio(
                            value: 'gcash',
                            groupValue: _paymentMethod,
                            activeColor: Color(0xFF12CF8A),
                            onChanged: (value) {
                              setState(() {
                                _paymentMethod = value.toString();
                              });
                            },
                          ),
                          const Text(
                            'GCash',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat-Regular',
                            ),
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
                      const Text(
                        'Shipping Details',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Montserrat-Bold',
                        ),
                      ),
                      SizedBox(height: 10),
                      const Text(
                        ' Delivery method',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Montserrat-Medium',
                        ),
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 'buyer_pick_up',
                            groupValue: _deliveryMethod,
                            activeColor: Color(0xFF12CF8A),
                            onChanged: (value) {
                              setState(() {
                                _deliveryMethod = value.toString();
                              });
                            },
                          ),
                          const Text(
                            'Buyer Pick-Up',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat-Regular',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      const Text(
                        ' Preferred Delivery Date',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Montserrat-Medium',
                        ),
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
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Regular',
                                ),
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
              SizedBox(height: 120),
              //CONFIRM BUTTON
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your confirmation logic here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF12CF8A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Confirm Order',
                        style: TextStyle(
                            fontSize: 15, fontFamily: 'Montserrat-ExtraBold'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(color: Color(0xFF12CF8A)),
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
