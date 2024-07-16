import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/features/screens/profile/profile_menu/listing_page.dart';
import 'package:regain_mobile/helper_functions.dart';
// import 'package:regain_mobile/model/address_model.dart';
// import 'package:regain_mobile/model/category.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/nav.dart';
// import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/provider/address_data_provider.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/category_data_provider.dart';
import 'package:regain_mobile/provider/product_data_provider.dart';
import 'package:regain_mobile/routes/route_manager.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class EditListingPage extends StatefulWidget {
  // final ViewProduct product;
  final Product product;

  const EditListingPage({super.key, required this.product});

  @override
  State<EditListingPage> createState() => _EditListingPageState();
}

class _EditListingPageState extends State<EditListingPage> {
  final _editProductKey = GlobalKey<FormState>();

  final productNameController = TextEditingController();
  final priceController = TextEditingController();
  final weightController = TextEditingController();
  final categoryController = TextEditingController();

  final descController = TextEditingController();
  final locationController = TextEditingController();

  bool isSellerDelivering = false;
  int? _selectedCategory;
  int? _selectedLocation;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() {
    productNameController.text = widget.product.productName;
    priceController.text = widget.product.price;
    // categoryController. = widget.product.categoryID as TextEditingValue;
    _selectedCategory = widget.product.categoryID;
    weightController.text = widget.product.weight;
    descController.text = widget.product.description ?? '';
    isSellerDelivering = widget.product.canDeliver;
    _selectedLocation = widget.product.location;

    final user = Provider.of<AppDataProvider>(context, listen: false).userId;
    Provider.of<CategoryDataProvider>(context, listen: false).getCategories();
    Provider.of<AddressDataProvider>(context, listen: false)
        .getUserAddresses(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Edit product listing', actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavigationMenu()));
            },
            icon: const Icon(
              Icons.home,
              color: white,
            )),
      ]),
      body: SingleChildScrollView(
        child: Form(
          key: _editProductKey,
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
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height * 0.09,
                child: TextFormField(
                  controller: productNameController,
                  decoration: const InputDecoration(
                    hintText: 'Name of the Product',
                    hintStyle: TextStyle(fontSize: 15.0),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height * 0.09,
                child: TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    hintText: 'Price',
                    hintStyle: TextStyle(fontSize: 15.0),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: Consumer<CategoryDataProvider>(
                        builder: (context, provider, child) =>
                            DropdownButtonFormField<int>(
                          hint: const Text('Category',
                              style: TextStyle(fontSize: 15.0)),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = value;
                            });
                          },
                          value: _selectedCategory,
                          items: provider.categoryList
                              .map((e) => DropdownMenuItem<int>(
                                    value: e.categoryID,
                                    child: Text(
                                      e.categoryName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(backgroundColor: white),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: TextFormField(
                        controller: weightController,
                        decoration: const InputDecoration(
                          hintText: 'Weight',
                          hintStyle: TextStyle(fontSize: 15.0),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height * 0.18,
                child: TextFormField(
                  controller: descController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText:
                        'Please provide a brief description of the recyclable product',
                    hintStyle: TextStyle(fontSize: 15.0),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Consumer<AddressDataProvider>(
                builder: (context, value, child) => Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: DropdownButtonFormField(
                    hint: const Text('Location',
                        style: TextStyle(fontSize: 15.0)),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: value.userAddress.map((e) {
                      return DropdownMenuItem<int>(
                        value: e.addressID,
                        child: Text(
                          '${e.city} - ${e.street}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(backgroundColor: white),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedLocation = value;
                      });
                    },
                    value: _selectedLocation,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Checkbox(
                      value: isSellerDelivering,
                      onChanged: (bool? value) {
                        setState(() {
                          isSellerDelivering = value!;
                        });
                      },
                    ),
                  ),
                  const Expanded(
                    flex: 5,
                    child: Text('Will you be providing delivery to the buyer?'),
                  ),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: const Icon(Icons.info_outline),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Info about delivery')));
                        },
                      )),
                ],
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Cancel btn
                      RegainButtons(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Row(
                                children: [
                                  const Icon(CupertinoIcons.info_circle),
                                  const SizedBox(width: 8),
                                  Text(
                                    ReGainTexts.alertCancel,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              content: Text(
                                ReGainTexts.alertEdtMsg,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    ReGainTexts.btnNo,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ListingPage()));
                                  },
                                  child: Text(ReGainTexts.btnYes,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                ),
                              ],
                            ),
                          );
                        },
                        text: ReGainTexts.btnCancel,
                        type: ButtonType.text,
                        size: ButtonSize.small,
                        txtSize: BtnTxtSize.large,
                      ),

                      //SPACE BETWEEN CANCEL AND UPDATE
                      const SizedBox(
                        width: 10,
                      ),

                      //update btn
                      RegainButtons(
                        onPressed: () {
                          updateProduct();
                        },
                        text: "Update product",
                        type: ButtonType.filled,
                        size: ButtonSize.small,
                        txtSize: BtnTxtSize.large,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  updateProduct() {
    if (_editProductKey.currentState!.validate()) {
      final prod = Product(
          productID: widget.product.productID,
          productName: productNameController.text,
          sellerID: Provider.of<AppDataProvider>(context, listen: false).userId,
          price: priceController.text,
          categoryID: _selectedCategory,
          weight: weightController.text,
          description: descController.text,
          // location: addresses.indexOf(locationController.text),
          location: _selectedLocation,
          canDeliver: isSellerDelivering);
      Provider.of<ProductDataProvider>(context, listen: false)
          .updateProduct(widget.product.productID!, prod)
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          Navigator.pushNamed(context, RouteManager.routeNavMenu);
          ReGainHelperFunctions.showSnackBar(context, response.message);
        }
      });
    }
  }

  @override
  void dispose() {
    productNameController.dispose();
    priceController.dispose();
    // categoryController.dispose();
    weightController.dispose();
    descController.dispose();
    locationController.dispose();
    super.dispose();
  }
}
