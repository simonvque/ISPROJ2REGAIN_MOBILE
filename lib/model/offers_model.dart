import 'package:freezed_annotation/freezed_annotation.dart';

part 'offers_model.freezed.dart';
part 'offers_model.g.dart';

@unfreezed
class OffersModel with _$OffersModel {
  factory OffersModel(
      {int? offerID,
      int? productID,
      int? buyerID,
      required String offerValue,
      required bool isAccepted,
      int? sellerID}) = _OffersModel;
  factory OffersModel.fromJson(Map<String, dynamic> json) =>
      _$OffersModelFromJson(json);
}
