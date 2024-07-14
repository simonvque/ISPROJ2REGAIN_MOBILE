// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      addressID: (json['addressID'] as num?)?.toInt(),
      unitNumber: json['unitNumber'] as String? ?? '',
      street: json['street'] as String,
      barangay: json['barangay'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
      zipCode: json['zipCode'] as String,
      userID: (json['userID'] as num).toInt(),
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'addressID': instance.addressID,
      'unitNumber': instance.unitNumber,
      'street': instance.street,
      'barangay': instance.barangay,
      'city': instance.city,
      'province': instance.province,
      'zipCode': instance.zipCode,
      'userID': instance.userID,
    };
