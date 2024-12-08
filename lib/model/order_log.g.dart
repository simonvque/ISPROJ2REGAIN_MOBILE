// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderLogImpl _$$OrderLogImplFromJson(Map<String, dynamic> json) =>
    _$OrderLogImpl(
      trackingID: (json['trackingID'] as num?)?.toInt(),
      orderID: (json['orderID'] as num).toInt(),
      deliveryDate: json['deliveryDate'] == null
          ? null
          : DateTime.parse(json['deliveryDate'] as String),
      prevStatus: json['prevStatus'] as String,
      updatedByUserID: (json['updatedByUserID'] as num).toInt(),
      timeStamp: DateTime.parse(json['timeStamp'] as String),
    );

Map<String, dynamic> _$$OrderLogImplToJson(_$OrderLogImpl instance) =>
    <String, dynamic>{
      'trackingID': instance.trackingID,
      'orderID': instance.orderID,
      'deliveryDate': instance.deliveryDate?.toIso8601String(),
      'prevStatus': instance.prevStatus,
      'updatedByUserID': instance.updatedByUserID,
      'timeStamp': instance.timeStamp.toIso8601String(),
    };
