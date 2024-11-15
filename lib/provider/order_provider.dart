import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/model/response_model.dart';

class OrderProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  List<OrderModel> _ordersBuyer = [];

  List<OrderModel>? get ordersBuyer => _ordersBuyer;

  List<OrderModel> _ordersBuyerPickup = [];

  List<OrderModel>? get ordersBuyerPickup => _ordersBuyerPickup;

  List<OrderModel> _ordersSeller = [];

  List<OrderModel>? get ordersSeller => _ordersSeller;

  // Future<List<ViewOffersModel>> getOffersByBuyerID(int buyerID) async {
  //   _allViewOffers = await _dataSource.getOffersByBuyerID(buyerID);
  //   notifyListeners();
  //   return _allViewOffers;
  // }

  Future<List<OrderModel>> getOrdersByDeliveryBuyer(
      String method, int buyerID) async {
    _ordersBuyer = await _dataSource.getOrdersByDeliveryBuyer(method, buyerID);
    notifyListeners();
    return _ordersBuyer;
  }

  Future<List<OrderModel>> getOrdersByPickupBuyer(
      String method, int buyerID) async {
    _ordersBuyerPickup =
        await _dataSource.getOrdersByDeliveryBuyer(method, buyerID);
    notifyListeners();
    return _ordersBuyerPickup;
  }

  Future<List<OrderModel>> getOrdersByDeliverSeller(
      String method, int sellerID) async {
    _ordersSeller =
        await _dataSource.getOrdersByDeliverySeller(method, sellerID);
    notifyListeners();
    return _ordersSeller;
  }

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
