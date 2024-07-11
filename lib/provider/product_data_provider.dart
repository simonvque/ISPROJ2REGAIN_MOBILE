import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/response_model.dart';

class ProductDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  List<Product> _allProducts = [];

  // final List<Product> _userProducts = [];

  List<Product> get allProducts => _allProducts;

  Future<ResponseModel> addProduct(Product product) {
    return _dataSource.addProduct(product);
  }

  Future<void> getAllProducts() async {
    _allProducts = await _dataSource.getAllProducts();
    notifyListeners();
  }

  Future<List<Product>> getProductsByUser(int userID) {
    return _dataSource.getProductsByUser(userID);
  }
}
