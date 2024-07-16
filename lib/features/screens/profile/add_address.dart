import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/profile/manage_addresses.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/address_model.dart';
import 'package:regain_mobile/nav.dart';
import 'package:regain_mobile/provider/address_data_provider.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/routes/route_manager.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  int userID = 1;
  int? addressID;
  final unitNumberController = TextEditingController();
  final streetController = TextEditingController();
  final barangayController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();

  final _addAddressKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        foregroundColor: white,
        title: const Text('Add Address'),
        iconTheme: const IconThemeData(color: white),
        actions: [
          // IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.add_location,
          //       color: white,
          //     )),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteManager.routeNavMenu);
              },
              icon: const Icon(
                Icons.home,
                color: white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addAddressKey,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Add Address Details',
                    style: TextStyle(
                      color: black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                // height: MediaQuery.of(context).size.height * 0.09,
                // width: MediaQuery.of(context).size.width * 0.65,
                child: TextFormField(
                  controller: unitNumberController,
                  decoration: InputDecoration(
                    labelText: 'Unit number, apartment, etc.',
                    labelStyle:
                        TextStyle(fontSize: 15.0, color: Colors.grey.shade700),
                    hintText: '(optional) ex: Unit 22B',
                    hintStyle: const TextStyle(fontSize: 15.0),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       flex: 3,
              //       child: Container(
              //         padding: const EdgeInsets.all(10.0),
              //         height: MediaQuery.of(context).size.height * 0.09,
              //         // width: MediaQuery.of(context).size.width * 0.65,
              //         child: TextFormField(
              //           controller: unitNumberController,
              //           decoration: InputDecoration(
              //             labelText: 'Unit number, apartment, etc.',
              //             labelStyle: TextStyle(
              //                 fontSize: 15.0, color: Colors.grey.shade700),
              //             hintText: '(optional) ex: Unit 22B',
              //             hintStyle: const TextStyle(fontSize: 15.0),
              //             border: const OutlineInputBorder(),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       flex: 2,
              //       child: Container(
              //         padding: const EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
              //         height: MediaQuery.of(context).size.height * 0.09,
              //         // width: MediaQuery.of(context).size.width * 0.30,
              //         child: TextFormField(
              //           keyboardType: TextInputType.number,
              //           inputFormatters: [
              //             FilteringTextInputFormatter.digitsOnly
              //           ],
              //           validator: (value) {
              //             if (value?.length != 4) {
              //               return "Please enter a valid zip code";
              //             }
              //           },
              //           controller: zipCodeController,
              //           decoration: InputDecoration(
              //             labelText: 'Zip Code',
              //             labelStyle: TextStyle(
              //                 fontSize: 15.0, color: Colors.grey.shade700),
              //             hintText: 'ex: 1651',
              //             hintStyle: const TextStyle(fontSize: 15.0),
              //             border: const OutlineInputBorder(),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Container(
                padding: const EdgeInsets.all(10.0),
                // height: MediaQuery.of(context).size.height * 0.09,
                child: TextFormField(
                  controller: streetController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a street address";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Street address, house number',
                    labelStyle:
                        TextStyle(fontSize: 15.0, color: Colors.grey.shade700),
                    hintText: 'ex: 117 Mindanao Ave',
                    hintStyle: const TextStyle(fontSize: 15.0),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                // height: MediaQuery.of(context).size.height * 0.09,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a barangay";
                    }
                  },
                  controller: barangayController,
                  decoration: InputDecoration(
                    labelText: 'Barangay, subdivision, etc',
                    labelStyle:
                        TextStyle(fontSize: 15.0, color: Colors.grey.shade700),
                    hintText: 'ex: Bambang',
                    hintStyle: const TextStyle(fontSize: 15.0),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                // height: MediaQuery.of(context).size.height * 0.09,
                child: TextFormField(
                  controller: cityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a city";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'City',
                    labelStyle:
                        TextStyle(fontSize: 15.0, color: Colors.grey.shade700),
                    hintText: 'ex: Pasig City',
                    hintStyle: const TextStyle(fontSize: 15.0),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                // height: MediaQuery.of(context).size.height * 0.09,
                child: TextFormField(
                  controller: stateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a state or region";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'State or region',
                    labelStyle:
                        TextStyle(fontSize: 15.0, color: Colors.grey.shade700),
                    hintText: 'ex: Metro Manila',
                    hintStyle: const TextStyle(fontSize: 15.0),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                // height: MediaQuery.of(context).size.height * 0.20,
                // width: MediaQuery.of(context).size.width * 0.30,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value?.length != 4) {
                      return "Please enter a valid zip code";
                    }
                  },
                  controller: zipCodeController,
                  decoration: InputDecoration(
                    labelText: 'Zip Code',
                    labelStyle:
                        TextStyle(fontSize: 15.0, color: Colors.grey.shade700),
                    hintText: 'ex: 1651',
                    hintStyle: const TextStyle(fontSize: 15.0),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5, 15, 5, 20),
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    backgroundColor: green,
                    foregroundColor: white,
                  ),
                  child: const Text('Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        //fontFamily: 'Montserrat',
                      )),
                  onPressed: () {
                    addAddress();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addAddress() {
    if (_addAddressKey.currentState!.validate()) {
      final address = AddressModel(
        unitNumber: unitNumberController.text,
        street: streetController.text,
        barangay: barangayController.text,
        city: cityController.text,
        province: stateController.text,
        zipCode: zipCodeController.text,
        userID: Provider.of<AppDataProvider>(context, listen: false).userId,
      );
      Provider.of<AddressDataProvider>(context, listen: false)
          .addAddress(address)
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          resetFields();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ManageAddresses()));
          ReGainHelperFunctions.showSnackBar(context, response.message);
        }
      });
    }
  }

  void resetFields() {
    unitNumberController.clear();
    streetController.clear();
    barangayController.clear();
    cityController.clear();
    stateController.clear();
    zipCodeController.clear();
  }

  @override
  void dispose() {
    unitNumberController.dispose();
    streetController.dispose();
    barangayController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }
}
