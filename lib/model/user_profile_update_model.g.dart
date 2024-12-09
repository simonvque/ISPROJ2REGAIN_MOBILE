// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileUpdateModelImpl _$$UserProfileUpdateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileUpdateModelImpl(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      username: json['username'] as String,
      profileImage: _$JsonConverterFromJson<String, Uint8List>(
          json['profileImage'], const Uint8ListConverter().fromJson),
      gcashQRcode: _$JsonConverterFromJson<String, Uint8List>(
          json['gcashQRcode'], const Uint8ListConverter().fromJson),
      junkshopName: json['junkshopName'] as String? ?? '',
    );

Map<String, dynamic> _$$UserProfileUpdateModelImplToJson(
        _$UserProfileUpdateModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'profileImage': _$JsonConverterToJson<String, Uint8List>(
          instance.profileImage, const Uint8ListConverter().toJson),
      'gcashQRcode': _$JsonConverterToJson<String, Uint8List>(
          instance.gcashQRcode, const Uint8ListConverter().toJson),
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
