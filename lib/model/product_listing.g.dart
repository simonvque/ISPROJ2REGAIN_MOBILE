// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      productID: (json['productID'] as num?)?.toInt(),
      sellerID: (json['sellerID'] as num?)?.toInt(),
      productName: json['productName'] as String,
      description: json['description'] as String? ?? '',
      weight: json['weight'] as String,
      location: (json['location'] as num?)?.toInt(),
      categoryID: (json['categoryID'] as num?)?.toInt(),
      price: json['price'] as String,
      canDeliver: json['canDeliver'] as bool,
      status: json['status'] as String? ?? 'Pending',
      image: _$JsonConverterFromJson<String, Uint8List>(
          json['image'], const Uint8ListConverter().fromJson),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'sellerID': instance.sellerID,
      'productName': instance.productName,
      'description': instance.description,
      'weight': instance.weight,
      'location': instance.location,
      'categoryID': instance.categoryID,
      'price': instance.price,
      'canDeliver': instance.canDeliver,
      'status': instance.status,
      'image': _$JsonConverterToJson<String, Uint8List>(
          instance.image, const Uint8ListConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
