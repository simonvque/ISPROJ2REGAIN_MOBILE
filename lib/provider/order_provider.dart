import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/model/response_model.dart';

class OrderProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  // List<OrderModel> _allViewOffers = [];

  // List<ViewOffersModel>? get viewoffers => _allViewOffers;

  // Future<List<ViewOffersModel>> getOffersByBuyerID(int buyerID) async {
  //   _allViewOffers = await _dataSource.getOffersByBuyerID(buyerID);
  //   notifyListeners();
  //   return _allViewOffers;
  // }

  // Future<List<ViewOffersModel>> getOffersByProductID(int prodID) async {
  //   _allViewOffers = await _dataSource.getOffersByProductID(prodID);
  //   notifyListeners();
  //   return _allViewOffers;
  // }

  // Future<ResponseModel> deleteOffers(int id) async {
  //   return _dataSource.deleteOffers(id);
  // }

  // Future<ResponseModel> updateOffers(
  //     int id, ViewOffersModel updatedOffer) async {
  //   return _dataSource.updateOffers(id, updatedOffer);
  // }

  Future<ResponseModel> addOrder(OrderModel order) async {
    return _dataSource.addOrder(order);
  }
}
