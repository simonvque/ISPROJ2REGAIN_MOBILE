import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/listings/add_equipment.dart';
import 'package:regain_mobile/features/screens/listings/add_product.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF12CF8A),
        foregroundColor: Colors.white,
        title: const Text('Add Listing'),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Text(
                'Product',
                style: TextStyle(
                  color: Color(0xFF3C3C3C),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  //fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.70,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                ),
                child: TextButton(
                  child: Text('PRODUCT'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade100,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddProduct()));
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Text(
                'Equipment',
                style: TextStyle(
                  color: Color(0xFF3C3C3C),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  //fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.70,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                ),
                child: TextButton(
                  child: Text('EQUIPMENT'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade100,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddEquipment()));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
