import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:regain_mobile/model/address_model.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/model/payment_model.dart';
import 'package:regain_mobile/model/view_product_model.dart';

part 'commission_model.freezed.dart';
part 'commission_model.g.dart';

@unfreezed
class CommissionModel with _$CommissionModel {
  factory CommissionModel(
      {int? commissionID,
      required int userID,
      required OrderModel order,
      required String commissionBalance,
      String? status,
      String? remarks,
      PaymentModel? payment}) = _CommissionModel;
  factory CommissionModel.fromJson(Map<String, dynamic> json) =>
      _$CommissionModelFromJson(json);
}
