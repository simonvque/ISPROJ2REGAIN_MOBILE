import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:regain_mobile/model/payment_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@unfreezed
class OrderModel with _$OrderModel {
  factory OrderModel(
      {int? orderID,
      required int productID,
      required int buyerID,
      DateTime? orderDate,
      required String deliveryMethod,
      required DateTime deliveryDate,
      PaymentModel? paymentMethod,
      required String totalAmount,
      required String currentStatus,
      int? addressID}) = _OrderModel;
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
