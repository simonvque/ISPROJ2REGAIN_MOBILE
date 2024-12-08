// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViewProductImpl _$$ViewProductImplFromJson(Map<String, dynamic> json) =>
    _$ViewProductImpl(
      productID: (json['productID'] as num).toInt(),
      productName: json['productName'] as String,
      location: json['location'] as String,
      price: json['price'] as String,
      sellerUsername: json['sellerUsername'] as String,
      description: json['description'] as String,
      weight: json['weight'] as String,
      category: json['category'] as String,
      canDeliver: json['canDeliver'] as bool,
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$$ViewProductImplToJson(_$ViewProductImpl instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'productName': instance.productName,
      'location': instance.location,
      'price': instance.price,
      'sellerUsername': instance.sellerUsername,
      'description': instance.description,
      'weight': instance.weight,
      'category': instance.category,
      'canDeliver': instance.canDeliver,
      'isFavorite': instance.isFavorite,
    };
