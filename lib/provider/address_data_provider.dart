import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/address_model.dart';
import 'package:regain_mobile/model/response_model.dart';

class AddressDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  List<AddressModel> _userAddress = [];

  List<AddressModel> get userAddress => _userAddress;

  Future<ResponseModel> addAddress(AddressModel addressModel) async {
    return _dataSource.addAddress(addressModel);
  }

  Future<ResponseModel> deleteAddress(int id) async {
    return _dataSource.deleteAddress(id);
  }

  Future<void> getUserAddresses(int id) async {
    _userAddress = await _dataSource.getAddressesByUser(id);
    notifyListeners();
  }
}
