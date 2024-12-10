// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentModelImpl _$$PaymentModelImplFromJson(Map<String, dynamic> json) =>
    _$PaymentModelImpl(
      id: (json['id'] as num?)?.toInt(),
      paymentType: json['paymentType'] as String?,
      amountPaid: json['amountPaid'] as String,
      referenceNumber: json['referenceNumber'] as String?,
      status: json['status'] as String?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$$PaymentModelImplToJson(_$PaymentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentType': instance.paymentType,
      'amountPaid': instance.amountPaid,
      'referenceNumber': instance.referenceNumber,
      'status': instance.status,
      'remarks': instance.remarks,
    };
