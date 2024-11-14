// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewoffers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViewOffersModelImpl _$$ViewOffersModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ViewOffersModelImpl(
      offerID: (json['offerID'] as num?)?.toInt(),
      buyerName: json['buyerName'] as String,
      product: ViewProduct.fromJson(json['product'] as Map<String, dynamic>),
      offerValue: json['offerValue'] as String,
      isAccepted: json['isAccepted'] as bool?,
      sellerName: json['sellerName'] as String,
    );

Map<String, dynamic> _$$ViewOffersModelImplToJson(
        _$ViewOffersModelImpl instance) =>
    <String, dynamic>{
      'offerID': instance.offerID,
      'buyerName': instance.buyerName,
      'product': instance.product,
      'offerValue': instance.offerValue,
      'isAccepted': instance.isAccepted,
      'sellerName': instance.sellerName,
    };
