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
      gcashQR: json['gcashQR'] as String? ?? '',
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
      'gcashQR': instance.gcashQR,
      'birthday': instance.birthday?.toIso8601String(),
      'junkshopName': instance.junkshopName,
    };
