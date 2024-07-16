import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/offers_model.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/viewoffers_model.dart';

class OffersDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  // late OffersModel? _offers;

  // OffersModel? get offers => _offers;

  List<ViewOffersModel> _allViewOffers = [];

  List<ViewOffersModel>? get viewoffers => _allViewOffers;

  Future<List<ViewOffersModel>> getOffersByBuyerID(int buyerID) async {
    _allViewOffers = await _dataSource.getOffersByBuyerID(buyerID);
    notifyListeners();
    return _allViewOffers;
  }

  Future<List<ViewOffersModel>> getOffersByProductID(int prodID) async {
    _allViewOffers = await _dataSource.getOffersByProductID(prodID);
    notifyListeners();
    return _allViewOffers;
  }

  Future<ResponseModel> deleteOffers(int id) async {
    return _dataSource.deleteOffers(id);
  }

  Future<ResponseModel> updateOffers(
      int id, ViewOffersModel updatedOffer) async {
    return _dataSource.updateOffers(id, updatedOffer);
  }

  Future<ResponseModel> addOffers(ViewOffersModel viewOffersModel) async {
    return _dataSource.addOffers(viewOffersModel);
  }
}
