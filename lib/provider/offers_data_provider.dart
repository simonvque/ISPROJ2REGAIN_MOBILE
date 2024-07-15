import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/offers_model.dart';
import 'package:regain_mobile/model/viewoffers_model.dart';

class OffersDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  // late OffersModel? _offers;

  // OffersModel? get offers => _offers;

  List<ViewOffersModel> _allViewOffers = [];

  List<ViewOffersModel>? get viewoffers => _allViewOffers;

  Future<void> getOffersByBuyerID(int buyerID) async {
    _allViewOffers = await _dataSource.getOffersByBuyerID(buyerID);
    notifyListeners();
  }

  Future<void> getOffersByProductID(int prodID) async {
    _allViewOffers = await _dataSource.getOffersByProductID(prodID);
    notifyListeners();
  }
}