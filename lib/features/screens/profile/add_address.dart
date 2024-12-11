import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/validations/form_validators.dart';
import 'package:regain_mobile/provider/address_data_provider.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/model/address_model.dart';
import 'package:regain_mobile/routes/route_manager.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final unitNumberController = TextEditingController();
  final streetController = TextEditingController();
  final barangayController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();

  final _addAddressKey = GlobalKey<FormState>();

  LatLng _currentMapPosition = LatLng(14.5995, 120.9842); // Default: Manila
  LatLng? _validatedMapPosition; // Track last validated position
  MapController _mapController = MapController();
  bool _isAddressValidated = false; // Track if address has been validated
  double _currentZoom = 13.0; // Track current zoom level

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        foregroundColor: white,
        title: const Text('Add Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: 300,
                      child: FlutterMap(
                        mapController: _mapController,
                        options: MapOptions(
                          initialCenter: _currentMapPosition,
                          initialZoom: _currentZoom,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c'],
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: _currentMapPosition,
                                width: 80.0,
                                height: 80.0,
                                child: Icon(
                                  Icons.location_pin,
                                  color: Colors.red,
                                  size: 40.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: Column(
                        children: [
                          FloatingActionButton(
                            mini: true,
                            backgroundColor: green,
                            onPressed: () => _zoomMap(1.0),
                            heroTag: "zoomIn", // Unique tag
                            child: Icon(Icons.zoom_in, color: white),
                          ),
                          const SizedBox(height: 8),
                          FloatingActionButton(
                            mini: true,
                            backgroundColor: green,
                            onPressed: () => _zoomMap(-1.0),
                            heroTag: "zoomOut", // Unique tag
                            child: Icon(Icons.zoom_out, color: white),
                          ),
                          const SizedBox(height: 8),
                          FloatingActionButton(
                            mini: true,
                            backgroundColor: green,
                            onPressed: _recenterMap,
                            heroTag: "recenter", // Unique tag
                            child: Icon(Icons.my_location, color: white),
                          ),
                        ],
                      )),
                ],
              ),
              Form(
                key: _addAddressKey,
                child: Column(
                  children: [
                    buildTextField(
                        unitNumberController,
                        'Unit number, house number, etc.',
                        '(optional) ex: Unit 22B',
                        validator: (value) =>
                            Validators.unitNumberValidation(value)),
                    buildTextField(
                        streetController,
                        'Street address, apartment, location',
                        'ex: 117 Mindanao Ave',
                        validator: (value) =>
                            Validators.streetAddressValidation(value)),
                    buildTextField(
                      barangayController,
                      'Barangay, subdivision, etc',
                      'ex: Bambang',
                      validator: (value) =>
                          Validators.barangayValidation(value),
                    ),
                    buildTextField(cityController, 'City', 'ex: Pasig City',
                        validator: (value) => Validators.cityStateValidation(
                            value,
                            fieldName: 'city')),
                    buildTextField(
                        stateController, 'State or region', 'ex: Metro Manila',
                        validator: (value) => Validators.cityStateValidation(
                            value,
                            fieldName: 'state')),
                    buildTextField(zipCodeController, 'Zip Code', 'ex: 1651',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) =>
                            Validators.zipCodeValidation(value)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RegainButtons(
                          text: 'Validate',
                          onPressed: validateAddress,
                          type: ButtonType.filled,
                          size: ButtonSize.small,
                          txtSize: BtnTxtSize.medium,
                        ),
                        RegainButtons(
                          text: 'Submit',
                          onPressed: handleSubmit,
                          type: ButtonType.filled,
                          size: ButtonSize.small,
                          txtSize: BtnTxtSize.medium,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      TextEditingController controller, String label, String hint,
      {String? Function(String?)? validator,
      TextInputType keyboardType = TextInputType.text,
      List<TextInputFormatter>? inputFormatters}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          errorMaxLines: 10,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  void _zoomMap(double zoomChange) {
    setState(() {
      _currentZoom += zoomChange;
    });
    _mapController.move(_currentMapPosition, _currentZoom);
  }

  void _recenterMap() {
    if (_validatedMapPosition != null) {
      setState(() {
        _currentMapPosition = _validatedMapPosition!;
        _currentZoom = 15.0; // Default zoom level after validation
      });
      _mapController.move(_currentMapPosition, _currentZoom);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "No validated address found. Please validate the address first."),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> handleSubmit() async {
    if (_addAddressKey.currentState!.validate()) {
      if (_isAddressValidated) {
        addAddress();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Please validate the address before submitting."),
          ),
        );
      }
    }
  }

  Future<void> validateAddress() async {
    final streetAddress = streetController.text;
    final city = cityController.text;
    final state = stateController.text;
    final zipCode = zipCodeController.text;

    if (streetAddress.isEmpty ||
        city.isEmpty ||
        state.isEmpty ||
        zipCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Please fill in Street Address, City, State/Region, and Zip Code."),
        ),
      );
      return;
    }

    final fullAddress = "$streetAddress, $city, $state, $zipCode";
    final url = Uri.parse(
        "https://nominatim.openstreetmap.org/search?q=$fullAddress&format=json&addressdetails=1");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);

        if (data.isNotEmpty) {
          final location = data.first;
          setState(() {
            _currentMapPosition = LatLng(
                double.parse(location['lat']), double.parse(location['lon']));
            _validatedMapPosition =
                _currentMapPosition; // Save validated position
          });
          _mapController.move(_currentMapPosition, 15.0);
          _isAddressValidated = true; // Mark address as validated
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Address validated successfully!")),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Address not found. Please try again.")),
          );
          _isAddressValidated = false; // Reset validation status
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Failed to connect to the validation service.")),
        );
        _isAddressValidated = false;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error validating address: $e")),
      );
      _isAddressValidated = false;
    }
  }

  void addAddress() {
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
        Navigator.pushReplacementNamed(context, RouteManager.routeNavMenu);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response.message)));
      }
    });
  }

  void resetFields() {
    unitNumberController.clear();
    streetController.clear();
    barangayController.clear();
    cityController.clear();
    stateController.clear();
    zipCodeController.clear();
    _isAddressValidated = false; // Reset validation status
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
