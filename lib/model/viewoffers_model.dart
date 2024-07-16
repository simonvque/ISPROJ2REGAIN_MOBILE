import 'package:freezed_annotation/freezed_annotation.dart';

part 'viewoffers_model.freezed.dart';
part 'viewoffers_model.g.dart';

@unfreezed
class ViewOffersModel with _$ViewOffersModel {
  factory ViewOffersModel(
      {int? offerID,
      int? productID,
      required String buyerName,
      required String offerValue,
      required bool isAccepted,
      required String sellerName}) = _ViewOffersModel;
  factory ViewOffersModel.fromJson(Map<String, dynamic> json) =>
      _$ViewOffersModelFromJson(json);
}
