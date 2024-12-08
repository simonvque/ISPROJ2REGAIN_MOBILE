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
      image: const Uint8ListConverter().fromJson(json['image'] as String),
      canDeliver: json['canDeliver'] as bool,
      status: json['status'] as String? ?? 'Pending',
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
      'image': const Uint8ListConverter().toJson(instance.image),
      'canDeliver': instance.canDeliver,
      'status': instance.status,
    };
