// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      orderID: (json['orderID'] as num?)?.toInt(),
      productID: (json['productID'] as num).toInt(),
      buyerID: (json['buyerID'] as num).toInt(),
      orderDate: json['orderDate'] == null
          ? null
          : DateTime.parse(json['orderDate'] as String),
      deliveryMethod: json['deliveryMethod'] as String,
      deliveryDate: DateTime.parse(json['deliveryDate'] as String),
      paymentMethod: json['paymentMethod'] == null
          ? null
          : PaymentModel.fromJson(
              json['paymentMethod'] as Map<String, dynamic>),
      totalAmount: json['totalAmount'] as String,
      currentStatus: json['currentStatus'] as String,
      addressID: (json['addressID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'orderID': instance.orderID,
      'productID': instance.productID,
      'buyerID': instance.buyerID,
      'orderDate': instance.orderDate?.toIso8601String(),
      'deliveryMethod': instance.deliveryMethod,
      'deliveryDate': instance.deliveryDate.toIso8601String(),
      'paymentMethod': instance.paymentMethod,
      'totalAmount': instance.totalAmount,
      'currentStatus': instance.currentStatus,
      'addressID': instance.addressID,
    };
