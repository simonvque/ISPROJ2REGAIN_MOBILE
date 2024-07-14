import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/routes/route_manager.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(color: green),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(CupertinoIcons.arrow_left, color: white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'My Listings',
            style: TextStyle(
              color: white,
              fontFamily: 'Montserrat-Bold',
            ),
          ),
        ),
        body: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade100,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteManager.routeAddProduct);
                    },
                    child: const Text('PRODUCT'),
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade100,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteManager.routeAddEquipment);
                    },
                    child: const Text('EQUIPMENT'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
