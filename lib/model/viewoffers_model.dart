import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:regain_mobile/model/view_product_model.dart';

part 'viewoffers_model.freezed.dart';
part 'viewoffers_model.g.dart';

@unfreezed
class ViewOffersModel with _$ViewOffersModel {
  factory ViewOffersModel(
      {int? offerID,
      required String buyerName,
      required ViewProduct product,
      required String offerValue,
      bool? isAccepted,
      required String sellerName}) = _ViewOffersModel;
  factory ViewOffersModel.fromJson(Map<String, dynamic> json) =>
      _$ViewOffersModelFromJson(json);
}
