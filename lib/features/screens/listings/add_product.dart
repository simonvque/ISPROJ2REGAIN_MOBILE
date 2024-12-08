import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/helper_functions.dart';
import 'package:regain_mobile/model/category.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/provider/address_data_provider.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/category_data_provider.dart';
import 'package:regain_mobile/provider/product_data_provider.dart';
import 'package:regain_mobile/routes/route_manager.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _addProductKey = GlobalKey<FormState>();

  final productNameController = TextEditingController();
  final priceController = TextEditingController();
  final weightController = TextEditingController();
  final descController = TextEditingController();

  bool isSellerDelivering = false;
  Category? _selectedCategory;
  int? _selectedLocation;
  File? _selectedImage; // Store the selected image
  final ImagePicker _imagePicker = ImagePicker(); // For image picking

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        foregroundColor: white,
        title: const Text('Add Product Listing'),
        iconTheme: const IconThemeData(color: white),
      ),
      body: Consumer<ProductDataProvider>(
        builder: (context, provider, child) {
          return Stack(
            children: [
              _buildForm(context),
              if (provider.isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _addProductKey,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(5.0),
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
            GestureDetector(
              onTap: _pickImage,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.30,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: black),
                      image: _selectedImage != null
                          ? DecorationImage(
                              image: FileImage(_selectedImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: _selectedImage == null
                        ? const Icon(
                            Icons.camera_alt,
                            color: white,
                            size: 40,
                          )
                        : null,
                  ),
                ),
              ),
            ),
            _buildTextField(
              controller: productNameController,
              hintText: 'Name of the Product',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a valid product name";
                }
                return null;
              },
            ),
            _buildTextField(
              controller: priceController,
              hintText: 'Price',
              prefixText: '₱',
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !_validateDecimalInput(value)) {
                  return "Please enter a valid price";
                }
                return null;
              },
            ),
            Consumer<CategoryDataProvider>(
              builder: (context, provider, child) =>
                  _buildCategoryDropdown(provider.categoryList),
            ),
            _buildTextField(
              controller: weightController,
              hintText: 'Weight',
              suffixText: 'kg',
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !_validateDecimalInput(value)) {
                  return "Please enter a valid weight";
                }
                return null;
              },
            ),
            _buildTextField(
              controller: descController,
              hintText: 'Description',
              maxLines: 5,
            ),
            _buildLocationDropdown(context),
            _buildDeliveryCheckbox(),
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
                onPressed: () => addProduct(context),
                child: const Text('Add Product'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pickImage() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void addProduct(BuildContext context) {
    if (_addProductKey.currentState!.validate()) {
      if (_selectedImage == null) {
        ReGainHelperFunctions.showSnackBar(
          context,
          'Please select an image for the product',
        );
        return;
      }

      final prod = Product(
        productName: productNameController.text,
        sellerID: Provider.of<AppDataProvider>(context, listen: false).userId,
        price: priceController.text,
        categoryID: _selectedCategory?.categoryID,
        weight: weightController.text,
        description: descController.text,
        location: _selectedLocation,
        canDeliver: isSellerDelivering,
        image: _selectedImage!.readAsBytesSync(),
      );

      Provider.of<ProductDataProvider>(context, listen: false)
          .addProduct(prod, _selectedImage, context)
          .then((response) {
        if (response.statusCode == 200) {
          resetFields();
          ReGainHelperFunctions.showSnackBar(
            context,
            'Product added successfully!',
          );
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushNamed(context, RouteManager.routeNavMenu);
          });
        } else {
          ReGainHelperFunctions.showSnackBar(
            context,
            'Failed to add product. Please try again.',
          );
        }
      }).catchError((error) {
        ReGainHelperFunctions.showSnackBar(
          context,
          'An unexpected error occurred. Please try again later.',
        );
      });
    }
  }

  String sanitizeMessage(String message) {
    if (message.length > 200) {
      return message.substring(0, 200) + '...'; // Truncate if too long
    }
    return message;
  }

  bool _validateDecimalInput(String input) {
    String pattern = r'^\d+(\.\d{1,2})?$';
    return RegExp(pattern).hasMatch(input);
  }

  void resetFields() {
    productNameController.clear();
    priceController.clear();
    weightController.clear();
    descController.clear();
    _selectedCategory = null;
    _selectedLocation = null;
    _selectedImage = null;
    isSellerDelivering = false;
    setState(() {});
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    String? prefixText,
    String? suffixText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          prefixText: prefixText,
          suffixText: suffixText,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildCategoryDropdown(List<Category> categories) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: DropdownButtonFormField<Category>(
        decoration: const InputDecoration(
          hintText: 'Category',
          border: OutlineInputBorder(),
        ),
        value: _selectedCategory,
        items: categories.map((category) {
          return DropdownMenuItem<Category>(
            value: category,
            child: Text(category.categoryName),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedCategory = value;
          });
        },
        validator: (value) {
          if (value == null) {
            return 'Please select a valid category';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildLocationDropdown(BuildContext context) {
    return Consumer<AddressDataProvider>(
      builder: (context, value, child) => Container(
        padding: const EdgeInsets.all(5.0),
        child: DropdownButtonFormField<int>(
          decoration: const InputDecoration(
            hintText: 'Location',
            border: OutlineInputBorder(),
          ),
          value: _selectedLocation,
          items: value.userAddress.map((address) {
            return DropdownMenuItem<int>(
              value: address.addressID,
              child: Text('${address.city} - ${address.street}'),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedLocation = value;
            });
          },
          validator: (value) {
            if (value == null) {
              return 'Please select a valid location';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildDeliveryCheckbox() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Checkbox(
              value: isSellerDelivering,
              onChanged: (bool? value) {
                setState(() {
                  isSellerDelivering = value!;
                });
              }),
        ),
        const Expanded(
          flex: 5,
          child: Text('Will you be providing delivery to the buyer?'),
        ),
      ],
    );
  }

  void _getData() {
    final user = Provider.of<AppDataProvider>(context, listen: false).userId;
    Provider.of<CategoryDataProvider>(context, listen: false).getCategories();
    Provider.of<AddressDataProvider>(context, listen: false)
        .getUserAddresses(user);
  }
}
