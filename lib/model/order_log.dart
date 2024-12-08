import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:regain_mobile/model/address_model.dart';
import 'package:regain_mobile/model/payment_model.dart';
import 'package:regain_mobile/model/view_product_model.dart';

part 'order_log.freezed.dart';
part 'order_log.g.dart';

@unfreezed
class OrderLog with _$OrderLog {
  factory OrderLog(
      {int? trackingID,
      required int orderID,
      DateTime? deliveryDate,
      required String prevStatus,
      required int updatedByUserID,
      required DateTime timeStamp}) = _OrderLog;
  factory OrderLog.fromJson(Map<String, dynamic> json) =>
      _$OrderLogFromJson(json);
}
