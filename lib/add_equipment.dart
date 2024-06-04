import 'package:flutter/material.dart';

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
        foregroundColor: Colors.white,
        title: const Text('Add Equipment Listing'),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Choose Image'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Add Details'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.09,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Name of the Equipment',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.09,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.18,
            child: TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Please provide a brief description of the equipment',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.09,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: const Color(0xFF12CF8A),
                foregroundColor: Colors.white,
              ),
              child: Text('Add Equipment'),
              onPressed: () {},
            ),
          ),
        ],
      )),
    );
  }
}
