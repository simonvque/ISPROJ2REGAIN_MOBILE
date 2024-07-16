// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewoffers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViewOffersModelImpl _$$ViewOffersModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ViewOffersModelImpl(
      offerID: (json['offerID'] as num?)?.toInt(),
      productID: (json['productID'] as num?)?.toInt(),
      buyerName: json['buyerName'] as String,
      offerValue: json['offerValue'] as String,
      isAccepted: json['isAccepted'] as bool,
      sellerName: json['sellerName'] as String,
    );

Map<String, dynamic> _$$ViewOffersModelImplToJson(
        _$ViewOffersModelImpl instance) =>
    <String, dynamic>{
      'offerID': instance.offerID,
      'productID': instance.productID,
      'buyerName': instance.buyerName,
      'offerValue': instance.offerValue,
      'isAccepted': instance.isAccepted,
      'sellerName': instance.sellerName,
    };
