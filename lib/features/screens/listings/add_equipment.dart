import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';

class AddEquipment extends StatefulWidget {
  const AddEquipment({super.key});

  @override
  State<AddEquipment> createState() => _AddEquipmentState();
}

class _AddEquipmentState extends State<AddEquipment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        foregroundColor: white,
        title: const Text('Add Equipment Listing'),
        iconTheme: const IconThemeData(color: white),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(10.0),
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
                  //fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.09,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Name of the Equipment',
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
          // Row(
          //   children: <Widget>[
          //     // Expanded(
          //     //   flex: 2,
          //     //   child: Container(
          //     //     padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
          //     //     height: MediaQuery.of(context).size.height * 0.09,
          //     //     child: TextFormField(
          //     //       decoration: InputDecoration(
          //     //         hintText: 'Category',
          //     //         hintStyle: TextStyle(fontSize: 15.0),
          //     //         border: OutlineInputBorder(),
          //     //       ),
          //     //     ),
          //     //   ),
          //     // ),
          //     Expanded(
          //       flex: 3,
          //       child: Container(
          //         padding: EdgeInsets.all(10.0),
          //         height: MediaQuery.of(context).size.height * 0.09,
          //       ),
          //     ),
          //   ],
          // ),
          Container(
            padding: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.18,
            child: TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Please provide a brief description of the equipment',
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
              child: const Text('Add Equipment',
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
