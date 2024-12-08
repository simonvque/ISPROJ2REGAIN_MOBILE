// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPasswordModelImpl _$$ResetPasswordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordModelImpl(
      otp: json['otp'] as String,
      email: json['email'] as String,
      expirationTime: DateTime.parse(json['expirationTime'] as String),
      isUsed: json['isUsed'] as bool,
    );

Map<String, dynamic> _$$ResetPasswordModelImplToJson(
        _$ResetPasswordModelImpl instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'email': instance.email,
      'expirationTime': instance.expirationTime.toIso8601String(),
      'isUsed': instance.isUsed,
    };
