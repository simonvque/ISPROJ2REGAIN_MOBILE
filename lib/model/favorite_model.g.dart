// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteModelImpl _$$FavoriteModelImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteModelImpl(
      favoriteID: (json['favoriteID'] as num?)?.toInt(),
      userID: (json['userID'] as num).toInt(),
      productID: (json['productID'] as num).toInt(),
      isFavorite: json['isFavorite'] as bool? ?? true,
      sellerID: (json['sellerID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FavoriteModelImplToJson(_$FavoriteModelImpl instance) =>
    <String, dynamic>{
      'favoriteID': instance.favoriteID,
      'userID': instance.userID,
      'productID': instance.productID,
      'isFavorite': instance.isFavorite,
      'sellerID': instance.sellerID,
    };
