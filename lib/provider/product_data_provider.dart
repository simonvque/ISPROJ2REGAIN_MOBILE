import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/category.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/view_product_model.dart';

class ProductDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  List<ViewProduct> _allProducts = [];
  List<Category> _categories = [];
  List<ViewProduct> _filteredProducts = [];
  late Product? _product;
  List<ViewProduct> _searchedProducts = [];
  List<Product> _userProducts = [];
  List<ViewProduct> _userViewProducts = [];
  bool _isLoading = false;
  String _errorMessage = '';

  Product? get product => _product;
  List<ViewProduct> get allProducts => _allProducts;
  List<Category> get categories => _categories;
  List<ViewProduct> get filteredProducts => _filteredProducts;
  List<ViewProduct> get searchedProducts => _searchedProducts;
  List<Product> get userProducts => _userProducts;
  List<ViewProduct> get userViewProducts => _userViewProducts;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  void handleError(BuildContext? context, String? errorMessage) {
    _errorMessage = errorMessage?.isNotEmpty == true
        ? errorMessage!
        : 'An unknown error occurred.';
    notifyListeners();

    debugPrint("Error: $_errorMessage"); // Log the error for debugging

    if (context != null) {
      // Use `ScaffoldMessenger.of(context).mounted` to check if the SnackBar is already in view
      if (ScaffoldMessenger.of(context).mounted) {
        ScaffoldMessenger.of(context)
            .clearSnackBars(); // Clear any existing SnackBars
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _errorMessage,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red.shade700,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }
  }

  // Image validation
  bool validateImage(File image) {
    const maxSize = 2 * 1024 * 1024; // 2 MB
    const allowedFormats = ['jpeg', 'jpg', 'png'];

    if (image.lengthSync() > maxSize) {
      return false; // Invalid size
    }

    final extension = image.path.split('.').last.toLowerCase();
    if (!allowedFormats.contains(extension)) {
      return false; // Invalid format
    }

    final mimeType = lookupMimeType(image.path);
    if (mimeType != null && !mimeType.startsWith('image/')) {
      return false; // Not an image
    }

    return true;
  }

  void logFileDetails(File image) {
    final mimeType = lookupMimeType(image.path);
    print("File Path: ${image.path}");
    print("MIME Type: $mimeType");
  }

  Future<ResponseModel> addProduct(
      Product product, File? image, BuildContext context) async {
    if (image != null) {
      // Log the file details for debugging
      logFileDetails(image);

      // Validate the image
      if (!validateImage(image)) {
        return ResponseModel(
            responseStatus: ResponseStatus.FAILED,
            message: 'Invalid image. Must be JPEG/PNG and under 2 MB.');
      }
    }

    _isLoading = true;
    notifyListeners();

    try {
      final response = await _dataSource.addProduct(product, image);

      // Handle only errors here
      if (response.responseStatus == ResponseStatus.FAILED) {
        handleError(context, response.message);
      }

      // Return the response to the caller
      return response;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<ResponseModel> updateProduct(
      int id, Product product, File? image, BuildContext context) async {
    if (image != null) {
      // Log the file details for debugging
      logFileDetails(image);

      // Validate the image
      if (!validateImage(image)) {
        handleError(context, 'Invalid image. Must be JPEG/PNG and under 2 MB.');
        return ResponseModel(
            responseStatus: ResponseStatus.FAILED,
            message: 'Image validation failed.');
      }
    }

    _isLoading = true;
    notifyListeners();

    try {
      final response = await _dataSource.updateProduct(id, product, image);
      if (response.responseStatus == ResponseStatus.FAILED) {
        handleError(context, response.message);
      }
      return response;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<ResponseModel> deleteProduct(int id) async {
    return _dataSource.deleteProduct(id);
  }

  Future<List<ViewProduct>> getAllProductsByUserFave(int userId) async {
    _allProducts = await _dataSource.getAllProductsByUserFave(userId);
    notifyListeners();
    return _allProducts;
  }

  Future<List<ViewProduct>> getViewProductsByUser(int userId) async {
    _userViewProducts = await _dataSource.getViewProductsByUser(userId);
    notifyListeners();
    return _userViewProducts;
  }

  Future<List<Product>> getProductsByUser(int userID) async {
    _userProducts = await _dataSource.getProductsByUser(userID);
    notifyListeners();
    return _userProducts;
  }

  Future<List<Object>> getCategories() async {
    try {
      _categories = await _dataSource.getCategories();
      notifyListeners();
      return _categories;
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    }
  }

  Future<List<ViewProduct>> getFilteredProductsByCategory(
      String category, int userId,
      {BuildContext? context}) async {
    _isLoading = true;
    _errorMessage = ''; // Reset error message before starting
    notifyListeners();

    try {
      _filteredProducts =
          await _dataSource.getFilteredProductsByCategory(category, userId);
      return _filteredProducts;
    } catch (e) {
      handleError(context, 'Failed to load filtered products.');
      return [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<List<ViewProduct>> searchProducts(String query, int userId,
      {BuildContext? context}) async {
    _isLoading = true;
    _errorMessage = ''; // Reset error message before starting
    notifyListeners();

    try {
      _searchedProducts = await _dataSource.searchProducts(query, userId);
      return _searchedProducts;
    } catch (e) {
      handleError(context, 'Failed to load search results.');
      return [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
