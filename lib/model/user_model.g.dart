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
      contactNumber: json['contactNumber'] as String? ?? '',
      password: json['password'] as String,
      email: json['email'] as String? ?? '',
      accountStatus: json['accountStatus'] as String? ?? '',
      penaltyPoints: (json['penaltyPoints'] as num?)?.toInt() ?? 0,
      commissionBalance: json['commissionBalance'] as String? ?? '0.00',
      junkshopName: json['junkshopName'] as String? ?? '',
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'contactNumber': instance.contactNumber,
      'password': instance.password,
      'email': instance.email,
      'accountStatus': instance.accountStatus,
      'penaltyPoints': instance.penaltyPoints,
      'commissionBalance': instance.commissionBalance,
      'junkshopName': instance.junkshopName,
    };
