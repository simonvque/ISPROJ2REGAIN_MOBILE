import 'dart:io';
import 'dart:typed_data';
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

class EditListingPage extends StatefulWidget {
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
  final descController = TextEditingController();

  bool isSellerDelivering = false;
  int? _selectedCategory;
  int? _selectedLocation;

  Uint8List? _existingImage;
  File? _newImage;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() {
    productNameController.text = widget.product.productName;
    priceController.text = widget.product.price;
    _selectedCategory = widget.product.categoryID;
    weightController.text = widget.product.weight;
    descController.text = widget.product.description ?? '';
    isSellerDelivering = widget.product.canDeliver;
    _selectedLocation = widget.product.location;
    _existingImage = widget.product.image;

    final user = Provider.of<AppDataProvider>(context, listen: false).userId;
    Provider.of<CategoryDataProvider>(context, listen: false).getCategories();
    Provider.of<AddressDataProvider>(context, listen: false)
        .getUserAddresses(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        foregroundColor: white,
        title: const Text('Edit Product Listing'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _editProductKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Update Image',
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
                        image: _newImage != null
                            ? DecorationImage(
                                image: FileImage(_newImage!),
                                fit: BoxFit.cover,
                              )
                            : _existingImage != null
                                ? DecorationImage(
                                    image: MemoryImage(_existingImage!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                      ),
                      child: (_newImage == null && _existingImage == null)
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: updateProduct,
                  child: const Text('Update Product'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _newImage = File(pickedFile.path);
      });
    }
  }

  void updateProduct() {
    if (_editProductKey.currentState!.validate()) {
      final updatedProduct = Product(
        productID: widget.product.productID,
        productName: productNameController.text,
        sellerID: Provider.of<AppDataProvider>(context, listen: false).userId,
        price: priceController.text,
        categoryID: _selectedCategory,
        weight: weightController.text,
        description: descController.text,
        location: _selectedLocation,
        canDeliver: isSellerDelivering,
        image:
            _newImage != null ? _newImage!.readAsBytesSync() : _existingImage!,
      );

      Provider.of<ProductDataProvider>(context, listen: false)
          .updateProduct(
        widget.product.productID!,
        updatedProduct,
        _newImage,
        context,
      )
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          Navigator.pop(context);
          ReGainHelperFunctions.showSnackBar(
            context,
            'Product has been successfully updated.',
          );
        } else if (response.responseStatus == ResponseStatus.FAILED) {
          ReGainHelperFunctions.showSnackBar(
            context,
            'Failed to update product. Please try again.',
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

  bool _validateDecimalInput(String input) {
    String pattern = r'^\d+(\.\d{1,2})?$';
    return RegExp(pattern).hasMatch(input);
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
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DropdownButtonFormField<int>(
        value: _selectedCategory,
        decoration: const InputDecoration(
          hintText: 'Category',
          border: OutlineInputBorder(),
        ),
        items: categories.map((category) {
          return DropdownMenuItem<int>(
            value: category.categoryID,
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
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: DropdownButtonFormField<int>(
          value: _selectedLocation,
          decoration: const InputDecoration(
            hintText: 'Location',
            border: OutlineInputBorder(),
          ),
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
      children: [
        Checkbox(
          value: isSellerDelivering,
          onChanged: (value) {
            setState(() {
              isSellerDelivering = value!;
            });
          },
        ),
        const Text('Will you be providing delivery to the buyer?'),
      ],
    );
  }
}
