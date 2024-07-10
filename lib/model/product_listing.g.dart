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
      weight: (json['weight'] as num).toDouble(),
      location: (json['location'] as num?)?.toInt(),
      category: (json['category'] as num?)?.toInt(),
      price: Decimal.fromJson(json['price'] as String),
      canDeliver: json['canDeliver'] as bool,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'sellerID': instance.sellerID,
      'productName': instance.productName,
      'description': instance.description,
      'weight': instance.weight,
      'location': instance.location,
      'category': instance.category,
      'price': instance.price,
      'canDeliver': instance.canDeliver,
    };
