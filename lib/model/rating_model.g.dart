// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatingImpl _$$RatingImplFromJson(Map<String, dynamic> json) => _$RatingImpl(
      ratedUserId: (json['ratedUserId'] as num).toInt(),
      ratedByUserId: (json['ratedByUserId'] as num).toInt(),
      rateValue: (json['rateValue'] as num).toInt(),
      comments: json['comments'] as String,
    );

Map<String, dynamic> _$$RatingImplToJson(_$RatingImpl instance) =>
    <String, dynamic>{
      'ratedUserId': instance.ratedUserId,
      'ratedByUserId': instance.ratedByUserId,
      'rateValue': instance.rateValue,
      'comments': instance.comments,
    };
