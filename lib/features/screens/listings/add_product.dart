import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/helper_functions.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool? isChecked = false;
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        foregroundColor: white,
        title: const Text('Add Product Listing'),
        iconTheme: IconThemeData(color: white),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Choose Image',
                style: TextStyle(
                  color: black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  //fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.30,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Add Details',
                style: TextStyle(
                  color: black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.09,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Name of the Product',
                hintStyle: TextStyle(fontSize: 15.0),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.09,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Price',
                hintStyle: TextStyle(fontSize: 15.0),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: DropdownButtonFormField(
                    hint: const Text('Category',
                        style: TextStyle(fontSize: 15.0)),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: <String>['one', 'two', 'three', 'four', 'five']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(backgroundColor: white),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedValue = newValue!;
                      });
                    },
                    value: _selectedValue,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Weight',
                      hintStyle: TextStyle(fontSize: 15.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.18,
            child: TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                hintText:
                    'Please provide a brief description of the recyclable product',
                hintStyle: TextStyle(fontSize: 15.0),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.09,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Location',
                hintStyle: TextStyle(fontSize: 15.0),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value;
                      });
                    }),
              ),
              const Expanded(
                flex: 5,
                child: Text('Will you be providing delivery to the buyer?'),
              ),
              Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: const Icon(Icons.info_outline),
                    onPressed: () {
                      ReGainHelperFunctions.showSnackBar(
                          context, 'info about delivery');
                    },
                  )),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: green,
                foregroundColor: white,
              ),
              child: const Text('Add Product',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    //fontFamily: 'Montserrat',
                  )),
              onPressed: () {},
            ),
          ),
        ],
      )),
    );
  }
}
