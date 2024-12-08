// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num?)?.toInt(),
      role: json['role'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      username: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String? ?? '',
      accountStatus: json['accountStatus'] as String? ?? 'Pending',
      penaltyPoints: (json['penaltyPoints'] as num?)?.toInt() ?? 0,
      phone: json['phone'] as String?,
      profileImagePath: json['profileImagePath'] as String? ?? '',
      profileImage: _$JsonConverterFromJson<String, Uint8List>(
          json['profileImage'], const Uint8ListConverter().fromJson),
      gcashQR: json['gcashQR'] as String? ?? '',
      gcashQRcode: _$JsonConverterFromJson<String, Uint8List>(
          json['gcashQRcode'], const Uint8ListConverter().fromJson),
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      junkshopName: json['junkshopName'] as String? ?? '',
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'accountStatus': instance.accountStatus,
      'penaltyPoints': instance.penaltyPoints,
      'phone': instance.phone,
      'profileImagePath': instance.profileImagePath,
      'profileImage': _$JsonConverterToJson<String, Uint8List>(
          instance.profileImage, const Uint8ListConverter().toJson),
      'gcashQR': instance.gcashQR,
      'gcashQRcode': _$JsonConverterToJson<String, Uint8List>(
          instance.gcashQRcode, const Uint8ListConverter().toJson),
      'birthday': instance.birthday?.toIso8601String(),
      'junkshopName': instance.junkshopName,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
