import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_service.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/entities/response_model.dart';
import 'package:regain_mobile/entities/user_model.dart';

class AppDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  Future<ResponseModel> addUser(UserModel user) {
    // insert some logic?
    return _dataSource.addUser(user);
  }
}
