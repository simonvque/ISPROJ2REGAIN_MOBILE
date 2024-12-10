import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/commissions_model.dart';
import 'package:regain_mobile/model/commissions_total.dart';
import 'package:regain_mobile/model/response_model.dart';

class CommissionsProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  late CommissionsTotal? _commissionsModel;

  CommissionsTotal get commissionsModel => _commissionsModel!;

  List<CommissionsModel> _commissionsList = [];

  List<CommissionsModel> get commissionsList => _commissionsList;

  Future<List<CommissionsModel>> getCommissions(int id) async {
    CommissionsTotal? commTotal = await _dataSource.getTotalCommissions(id);
    _commissionsModel = commTotal;
    _commissionsList = await commTotal!.commsList!;
    if (commTotal.commsList == null) {
      _commissionsList = [];
    }
    return _commissionsList;
    //notifyListeners();
  }

  Future<ResponseModel> addPayment(int id, List<CommissionsModel> list) async {
    ResponseModel res = await _dataSource.addPaymentForCommissions(id, list);
    if (res.statusCode == 200) {
      notifyListeners();
    }
    return res;
  }
}
