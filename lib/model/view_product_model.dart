import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:decimal/decimal.dart';

part 'view_product_model.freezed.dart';
part 'view_product_model.g.dart';

@unfreezed
class ViewProduct with _$ViewProduct {
  factory ViewProduct(
      {required int productID,
      required String productName,
      required String location,
      required String price,
      required String sellerUsername,
      required String weight,
      required String category,
      required bool canDeliver,
      required bool isFavorite}) = _ViewProduct;
  factory ViewProduct.fromJson(Map<String, dynamic> json) =>
      _$ViewProductFromJson(json);
}
