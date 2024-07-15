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
      offervalue: json['offervalue'] as String,
      isAccepted: json['isAccepted'] as bool,
      sellerName: json['sellerName'] as String,
    );

Map<String, dynamic> _$$ViewOffersModelImplToJson(
        _$ViewOffersModelImpl instance) =>
    <String, dynamic>{
      'offerID': instance.offerID,
      'productID': instance.productID,
      'buyerName': instance.buyerName,
      'offervalue': instance.offervalue,
      'isAccepted': instance.isAccepted,
      'sellerName': instance.sellerName,
    };
