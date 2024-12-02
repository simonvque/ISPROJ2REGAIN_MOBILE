import 'package:flutter/material.dart';
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

  Product? get product => _product;

  // List<ViewProduct> _userProducts = [];

  // List<ViewProduct> get userProducts => _userProducts;

  List<Product> _userProducts = [];

  List<Product> get userProducts => _userProducts;

  List<ViewProduct> _userViewProducts = [];

  List<ViewProduct> get userViewProducts => _userViewProducts;

  List<ViewProduct> get allProducts => _allProducts;

  List<Category> get categories => _categories;

  List<ViewProduct> get filteredProducts => _filteredProducts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> getProductById(int prodID) async {
    _product = await _dataSource.getProductById(prodID);
    notifyListeners();
  }

  Future<ResponseModel> addProduct(Product product) {
    return _dataSource.addProduct(product);
  }

  Future<ResponseModel> updateProduct(int id, Product product) {
    return _dataSource.updateProduct(id, product);
  }

  Future<ResponseModel> deleteProduct(int id) {
    return _dataSource.deleteProduct(id);
  }

  // Future<List<Product>> getAllProducts() async {
  //   _allProducts = await _dataSource.getAllProducts();
  //   notifyListeners();
  //   return _allProducts;
  // }

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

// Fetch categories for filtering
  Future<List<Object>> getCategories() async {
    try {
      _categories = await _dataSource.getCategories(); // Call your API here
      notifyListeners();
      return _categories;
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    }
  }

  // Fetch products filtered by category
  Future<List<ViewProduct>> getFilteredProductsByCategory(
      String category, int userId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _filteredProducts =
          await _dataSource.getFilteredProductsByCategory(category, userId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load filtered products: $e';
      print(_errorMessage);
      return [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return _filteredProducts;
  }
}
