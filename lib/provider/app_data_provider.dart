import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/user_model.dart';

class AppDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  late Object? _userId;

  get userId => _userId;

  void setUser(int id) {
    _userId = id;
    notifyListeners();
  }

  // //private list
  // List<Category> _categoryList = [];

  // //getter to private list
  // List<Category> get categoryList => _categoryList;

  Future<ResponseModel> addUser(UserModel user) {
    // insert some logic?

    return _dataSource.addUser(user);
  }

  Future<ResponseModel> login(UserModel user) async {
    ResponseModel response = await _dataSource.login(user);
    _userId = response.object;
    notifyListeners();
    return response;
    // _userId = response.object.
  }

  // Future<void> getCategories() async {
  //   _categoryList = await _dataSource.getCategories();
  //   notifyListeners();
  // }

  // Future<ResponseModel> addProduct(Product product) {
  //   return _dataSource.addProduct(product);
  // }
}
