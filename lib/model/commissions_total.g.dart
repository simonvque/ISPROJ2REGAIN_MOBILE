// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commissions_total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommissionsTotalImpl _$$CommissionsTotalImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionsTotalImpl(
      totalBal: json['totalBal'] as String,
      commsList: (json['commsList'] as List<dynamic>?)
          ?.map((e) => CommissionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CommissionsTotalImplToJson(
        _$CommissionsTotalImpl instance) =>
    <String, dynamic>{
      'totalBal': instance.totalBal,
      'commsList': instance.commsList,
    };
