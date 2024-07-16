import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/profile/manage_addresses.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/address_model.dart';
import 'package:regain_mobile/provider/address_data_provider.dart';
import 'package:regain_mobile/routes/route_manager.dart';

class EditAddress extends StatefulWidget {
  final AddressModel address;
  const EditAddress({super.key, required this.address});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  int? addressID;
  final unitNumberController = TextEditingController();
  final streetController = TextEditingController();
  final barangayController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() {
    // unitNumberController.text;
    addressID = widget.address.addressID;
    unitNumberController.text = widget.address.unitNumber!;
    // widget.address.unitNumber != null ? '' : widget.address.unitNumber;
    streetController.text = widget.address.street;
    barangayController.text = widget.address.barangay;
    cityController.text = widget.address.city;
    stateController.text = widget.address.province;
    zipCodeController.text = widget.address.zipCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        foregroundColor: white,
        title: const Text('Details'),
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
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Text(
                  'Address Details',
                  style: TextStyle(
                    color: black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: TextFormField(
                    readOnly: true,
                    controller: unitNumberController,
                    decoration: InputDecoration(
                      labelText: 'Unit number, apartment, etc.',
                      labelStyle: TextStyle(
                          fontSize: 15.0, color: Colors.grey.shade700),
                      hintText: '(optional) ex: Unit 22B',
                      hintStyle: const TextStyle(fontSize: 15.0),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: TextFormField(
                    readOnly: true,
                    controller: zipCodeController,
                    decoration: InputDecoration(
                      labelText: 'Zip Code',
                      labelStyle: TextStyle(
                          fontSize: 15.0, color: Colors.grey.shade700),
                      hintText: 'ex: 1651',
                      hintStyle: const TextStyle(fontSize: 15.0),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              height: MediaQuery.of(context).size.height * 0.09,
              child: TextFormField(
                readOnly: true,
                controller: streetController,
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
              height: MediaQuery.of(context).size.height * 0.09,
              child: TextFormField(
                readOnly: true,
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
              height: MediaQuery.of(context).size.height * 0.09,
              child: TextFormField(
                readOnly: true,
                controller: cityController,
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
              height: MediaQuery.of(context).size.height * 0.09,
              child: TextFormField(
                readOnly: true,
                controller: stateController,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
                  height: MediaQuery.of(context).size.height * 0.10,
                  // width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      backgroundColor: Colors.grey.shade700,
                      foregroundColor: white,
                    ),
                    child: const Text('Delete',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          //fontFamily: 'Montserrat',
                        )),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            title: Row(
                              children: [
                                const Icon(
                                    CupertinoIcons.exclamationmark_triangle,
                                    color: red),
                                const SizedBox(width: 8),
                                Text(
                                  "Delete Address",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            content: Text(
                              "Are you sure you want to delete this address?",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                },
                                child: Text(
                                  ReGainTexts.btnCancel,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              TextButton(
                                child: const Text('Delete'),
                                onPressed: () {
                                  // delete function here <<<<<<<<<<<<<
                                  Navigator.pop(context);
                                  deleteAddress();
                                },
                              ),
                            ]),
                      );
                    },
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
                //   height: MediaQuery.of(context).size.height * 0.10,
                //   // width: MediaQuery.of(context).size.width * 0.9,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(5.0)),
                //       backgroundColor: green,
                //       foregroundColor: white,
                //     ),
                //     child: const Text('Submit',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w800,
                //           //fontFamily: 'Montserrat',
                //         )),
                //     onPressed: () {},
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void deleteAddress() {
    Provider.of<AddressDataProvider>(context, listen: false)
        .deleteAddress(addressID!)
        .then((response) {
      if (response.statusCode == 200) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ManageAddresses()));
        ReGainHelperFunctions.showSnackBar(context, response.message);
      } else if (response.statusCode == 400) {
        ReGainHelperFunctions.showSnackBar(context,
            '${response.message}: You cannot delete this address, as you have pending transactions with this address in use.');
      }
    });
  }
}
