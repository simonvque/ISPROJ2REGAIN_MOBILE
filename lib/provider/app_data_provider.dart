import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/user_model.dart';

class AppDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  late int? _userId;

  get userId => _userId;

  late UserModel? _user;

  UserModel? get user => _user;

  void resetUser() {
    _user = null;
    _userId = null;
    notifyListeners();
  }

  Future<ResponseModel> addUser(UserModel user) {
    // insert some logic?

    return _dataSource.addUser(user);
  }

  Future<ResponseModel> login(UserModel userDTO) async {
    ResponseModel response = await _dataSource.login(userDTO);
    if (response.statusCode == 200) {
      _user = UserModel.fromJson(response.response);
      _userId = user!.id;
    }

    notifyListeners();
    return response;
    // _userId = response.object.
  }

  Future<ResponseModel> updateUser(UserModel userDTO) async {
    ResponseModel response = await _dataSource.updateUser(userDTO);
    if (response.statusCode == 200) {
      _user = UserModel.fromJson(response.response);
      _userId = user!.id;
    }

    notifyListeners();
    return response;
  }
}
