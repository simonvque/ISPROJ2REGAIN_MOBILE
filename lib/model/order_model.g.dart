// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      orderID: (json['orderID'] as num?)?.toInt(),
      product: ViewProduct.fromJson(json['product'] as Map<String, dynamic>),
      buyerUsername: json['buyerUsername'] as String,
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
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'orderID': instance.orderID,
      'product': instance.product,
      'buyerUsername': instance.buyerUsername,
      'orderDate': instance.orderDate?.toIso8601String(),
      'deliveryMethod': instance.deliveryMethod,
      'deliveryDate': instance.deliveryDate.toIso8601String(),
      'paymentMethod': instance.paymentMethod,
      'totalAmount': instance.totalAmount,
      'currentStatus': instance.currentStatus,
      'address': instance.address,
    };
