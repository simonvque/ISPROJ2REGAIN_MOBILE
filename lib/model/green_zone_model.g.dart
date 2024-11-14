// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'green_zone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GreenZoneModelImpl _$$GreenZoneModelImplFromJson(Map<String, dynamic> json) =>
    _$GreenZoneModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      link: json['link'] as String,
      summary: json['summary'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$GreenZoneModelImplToJson(
        _$GreenZoneModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'link': instance.link,
      'summary': instance.summary,
      'date': instance.date.toIso8601String(),
    };
