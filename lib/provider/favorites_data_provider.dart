import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/view_product_model.dart';

class FavoritesDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  List<ViewProduct> _userFavorites = [];

  List<ViewProduct> get userFavorites => _userFavorites;

  // Future<ViewProduct> addFavorite(Product product, Integer userId) {
  //   return _dataSource.addFavorite(product);
  // }

  Future<List<ViewProduct>> getFavoritesByUser(int userID) async {
    _userFavorites = await _dataSource.getUserFavorites(userID);
    notifyListeners();
    return _userFavorites;
  }
}
