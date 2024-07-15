// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OffersModelImpl _$$OffersModelImplFromJson(Map<String, dynamic> json) =>
    _$OffersModelImpl(
      offerID: (json['offerID'] as num?)?.toInt(),
      productID: (json['productID'] as num?)?.toInt(),
      buyerID: (json['buyerID'] as num?)?.toInt(),
      offervalue: json['offervalue'] as String,
      isAccepted: json['isAccepted'] as bool,
      sellerID: (json['sellerID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OffersModelImplToJson(_$OffersModelImpl instance) =>
    <String, dynamic>{
      'offerID': instance.offerID,
      'productID': instance.productID,
      'buyerID': instance.buyerID,
      'offervalue': instance.offervalue,
      'isAccepted': instance.isAccepted,
      'sellerID': instance.sellerID,
    };
