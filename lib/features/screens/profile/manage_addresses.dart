import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/profile/add_address.dart';
import 'package:regain_mobile/features/screens/profile/edit_address.dart';
import 'package:regain_mobile/model/address_model.dart';
import 'package:regain_mobile/routes/route_manager.dart';

class ManageAddresses extends StatefulWidget {
  ManageAddresses({super.key});

  @override
  State<ManageAddresses> createState() => _ManageAddressesState();
}

class _ManageAddressesState extends State<ManageAddresses> {
  List<AddressModel> addresses = [];

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() {
    // *COMMENT OUT* WHEN CONNNECTING TO DB
    addresses = [
      AddressModel(
          street: '26 Diego Silang',
          barangay: 'AFPOVAI',
          city: 'Taguig',
          province: 'Metro Manila',
          zipCode: '1640',
          userID: 1),
      AddressModel(
          street: 'San Lorenzo Drive',
          barangay: 'San Lorenzo',
          city: 'Makati',
          province: 'Metro Manila',
          zipCode: '1640',
          userID: 1)
    ];
  }

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
            body: Container(
              child: Column(
                children: [
                  Material(
                    elevation: 1.0,
                    child: ListTile(
                      leading: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddAddress()));
                        },
                      ),
                      title: const Text(
                        'Add',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat-SemiBold'),
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: addresses.length,
                          itemBuilder: (context, index) {
                            final AddressModel address = addresses[index];
                            return AddressItem(addressItem: address);
                          })),
                ],
              ),
            )
            // Column(
            //   children: [
            //     _buildCaptionTitle(context),
            //     const Divider(),
            //     // SingleChildScrollView(
            //     //     child: ListView.builder(itemBuilder: (context, index) {
            //     //   final AddressModel address = addresses[index];
            //     //   return AddressItem(addressItem: address);
            //     // }))
            //   ],
            // ),
            ));
  }
}

class AddressItem extends StatefulWidget {
  final AddressModel addressItem;
  const AddressItem({super.key, required this.addressItem});

  @override
  State<AddressItem> createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // isThreeLine: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      title: Text(
        widget.addressItem.city,
        style: const TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EditAddress(address: widget.addressItem)));
          },
          child: const Icon(CupertinoIcons.chevron_forward)),
      subtitle: widget.addressItem.unitNumber != null
          ? Text(
              '${widget.addressItem.unitNumber},  ${widget.addressItem.street}, ${widget.addressItem.barangay}, ${widget.addressItem.province}')
          : Text(
              '${widget.addressItem.street}, ${widget.addressItem.barangay}, ${widget.addressItem.province}'),
    );
  }
}
