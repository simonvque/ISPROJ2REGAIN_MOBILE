// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commissions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommissionsModelImpl _$$CommissionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionsModelImpl(
      commissionID: (json['commissionID'] as num?)?.toInt(),
      userID: (json['userID'] as num).toInt(),
      order: json['order'] == null
          ? null
          : OrderModel.fromJson(json['order'] as Map<String, dynamic>),
      commissionBalance: json['commissionBalance'] as String,
      status: json['status'] as String?,
      remarks: json['remarks'] as String?,
      payment: json['payment'] == null
          ? null
          : PaymentModel.fromJson(json['payment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommissionsModelImplToJson(
        _$CommissionsModelImpl instance) =>
    <String, dynamic>{
      'commissionID': instance.commissionID,
      'userID': instance.userID,
      'order': instance.order,
      'commissionBalance': instance.commissionBalance,
      'status': instance.status,
      'remarks': instance.remarks,
      'payment': instance.payment,
    };
