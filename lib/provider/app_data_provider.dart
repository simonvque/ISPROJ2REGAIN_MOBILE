import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_service.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/features/screens/listings/add_product.dart';
import 'package:regain_mobile/model/category.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/user_model.dart';

class AppDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  // //private list
  // List<Category> _categoryList = [];

  // //getter to private list
  // List<Category> get categoryList => _categoryList;

  Future<ResponseModel> addUser(UserModel user) {
    // insert some logic?

    return _dataSource.addUser(user);
  }

  // Future<void> getCategories() async {
  //   _categoryList = await _dataSource.getCategories();
  //   notifyListeners();
  // }

  // Future<ResponseModel> addProduct(Product product) {
  //   return _dataSource.addProduct(product);
  // }
}
