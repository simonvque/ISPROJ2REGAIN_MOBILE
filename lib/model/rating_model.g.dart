// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatingImpl _$$RatingImplFromJson(Map<String, dynamic> json) => _$RatingImpl(
      ratingId: (json['ratingId'] as num).toInt(),
      ratedUserId: (json['ratedUserId'] as num).toInt(),
      ratedByUserId: (json['ratedByUserId'] as num).toInt(),
      rateValue: (json['rateValue'] as num).toInt(),
      comments: json['comments'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      dateEdited: json['dateEdited'] == null
          ? null
          : DateTime.parse(json['dateEdited'] as String),
    );

Map<String, dynamic> _$$RatingImplToJson(_$RatingImpl instance) =>
    <String, dynamic>{
      'ratingId': instance.ratingId,
      'ratedUserId': instance.ratedUserId,
      'ratedByUserId': instance.ratedByUserId,
      'rateValue': instance.rateValue,
      'comments': instance.comments,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'dateEdited': instance.dateEdited?.toIso8601String(),
    };
