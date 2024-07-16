import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/favorite_model.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/view_product_model.dart';

class FavoritesDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  List<ViewProduct> _userFavorites = [];

  List<ViewProduct> get userFavorites => _userFavorites;

  Future<ResponseModel> addFavorite(FavoriteModel fave) {
    notifyListeners();
    return _dataSource.addFavorite(fave);
  }

  Future<List<ViewProduct>> getFavoritesByUser(int userID) async {
    _userFavorites = await _dataSource.getUserFavorites(userID);
    notifyListeners();
    return _userFavorites;
  }

  Future<ResponseModel> deleteFavorite(int userId, int prodId) async {
    ResponseModel response = await _dataSource.deleteFavorite(userId, prodId);
    notifyListeners();
    return response;
  }
}
