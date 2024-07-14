import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/routes/route_manager.dart';

class ManageAddresses extends StatefulWidget {
  const ManageAddresses({super.key});

  @override
  State<ManageAddresses> createState() => _ManageAddressesState();
}

class _ManageAddressesState extends State<ManageAddresses> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(color: Color(0xFF12CF8A)),
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
              'Addresses',
              style: TextStyle(
                color: white,
                fontFamily: 'Montserrat-Bold',
              ),
            ),
            actions: [
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
          body: Column(
            children: [
              _buildCaptionTitle(context),
              const Divider(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(color: Colors.grey.shade400),
                    ),
                    Container()
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildCaptionTitle(BuildContext context) => Container(
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('Manage your saved addresses.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Montserrat-Medium',
                  ))
            ],
          ),
        ),
      );
}
