import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_listing.freezed.dart';
part 'product_listing.g.dart';

@unfreezed
class Product with _$Product {
  factory Product(
      {int? productID,
      required int? sellerID,
      required String productName,
      @Default('') String? description,
      required String weight,
      required int? location,
      required int? categoryID,
      required String price,
      required bool canDeliver}) = _Product;
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
