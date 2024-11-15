import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@unfreezed
class PaymentModel with _$PaymentModel {
  factory PaymentModel(
      {int? id,
      required String paymentType,
      required String amountPaid,
      String? referenceNumber,
      String? status,
      String? remarks}) = _PaymentModel;
  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}
