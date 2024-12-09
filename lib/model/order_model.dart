import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:regain_mobile/model/address_model.dart';
import 'package:regain_mobile/model/payment_model.dart';
import 'package:regain_mobile/model/view_product_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@unfreezed
class OrderModel with _$OrderModel {
  factory OrderModel(
      {int? orderID,
      required ViewProduct product,
      required String buyerUsername,
      DateTime? orderDate,
      required String deliveryMethod,
      required DateTime deliveryDate,
      PaymentModel? paymentMethod,
      required String totalAmount,
      String? commissionFee,
      required String currentStatus,
      AddressModel? address}) = _OrderModel;
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
