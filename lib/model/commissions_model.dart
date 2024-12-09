import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/model/payment_model.dart';

part 'commissions_model.freezed.dart';
part 'commissions_model.g.dart';

@unfreezed
class CommissionsModel with _$CommissionsModel {
  factory CommissionsModel(
      {int? commissionID,
      required int userID,
      required OrderModel? order,
      required String commissionBalance,
      String? status,
      String? remarks,
      PaymentModel? payment}) = _CommissionsModel;
  factory CommissionsModel.fromJson(Map<String, dynamic> json) =>
      _$CommissionsModelFromJson(json);
}
