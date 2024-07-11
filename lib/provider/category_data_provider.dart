import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/category.dart';

class CategoryDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  //private list
  List<Category> _categoryList = [];

  //getter to private list
  List<Category> get categoryList => _categoryList;

  var _selectedCategory;

  get category => _selectedCategory;

  Future<void> getCategories() async {
    _categoryList = await _dataSource.getCategories();
    notifyListeners();
  }
}
