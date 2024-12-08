import 'dart:convert';
import 'dart:typed_data';

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
      required bool canDeliver,
      @Default('Pending') String? status,
      @Uint8ListConverter() required Uint8List image}) = _Product;
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

// Custom converter for Uint8List
class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) => base64Decode(json);

  @override
  String toJson(Uint8List object) => base64Encode(object);
}
