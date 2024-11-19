// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserIDModelImpl _$$_UserIDModelImplFromJson(Map<String, dynamic> json) =>
    _$_UserIDModelImpl(
      id: (json['id'] as num?)?.toInt(),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      idType: json['idType'] as String?,
      idNumber: json['idNumber'] as String?,
      idImage: json['idImage'] as String?,
    );

Map<String, dynamic> _$$_UserIDModelImplToJson(_$_UserIDModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'idType': instance.idType,
      'idNumber': instance.idNumber,
      'idImage': instance.idImage,
    };
