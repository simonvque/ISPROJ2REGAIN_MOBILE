import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/response_model.dart';

class ProductDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  Future<ResponseModel> addProduct(Product product) {
    return _dataSource.addProduct(product);
  }
}
