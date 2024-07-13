import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/view_product_model.dart';

class ProductDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  List<ViewProduct> _allProducts = [];

  late Product? _product;

  Product? get product => _product;

  // final List<Product> _userProducts = [];

  List<ViewProduct> get allProducts => _allProducts;

  Future<void> getProductById(int prodID) async {
    _product = await _dataSource.getProductById(prodID);
    notifyListeners();
  }

  Future<ResponseModel> addProduct(Product product) {
    return _dataSource.addProduct(product);
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

  Future<List<Product>> getProductsByUser(int userID) {
    return _dataSource.getProductsByUser(userID);
  }
}
