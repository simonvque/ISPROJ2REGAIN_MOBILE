import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Add Product Listing'),
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
                hintText: 'Name of the Product',
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
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Weight',
                      border: OutlineInputBorder(),
                    ),
                  ),
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
                hintText:
                    'Please provide a brief description of the recyclable product',
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
              Expanded(
                flex: 5,
                child: Text('Will you be providing delivery to the buyer?'),
              ),
              Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.info_outline),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('info about delivery')));
                    },
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 20),
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: const Color(0xFF12CF8A),
                foregroundColor: Colors.white,
              ),
              child: Text('Add Product'),
              onPressed: () {},
            ),
          ),
        ],
      )),
    );
  }
}
