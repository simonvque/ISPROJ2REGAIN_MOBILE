// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserReportImpl _$$UserReportImplFromJson(Map<String, dynamic> json) =>
    _$UserReportImpl(
      userReportID: (json['userReportID'] as num?)?.toInt(),
      reporterID: (json['reporterID'] as num).toInt(),
      reportedUserID: (json['reportedUserID'] as num).toInt(),
      reasonCategoryID: (json['reasonCategoryID'] as num).toInt(),
      reportReply: json['reportReply'] as String?,
      details: json['details'] as String?,
      timeStamp: json['timeStamp'] as String?,
      userReportStatus: json['userReportStatus'] as String?,
    );

Map<String, dynamic> _$$UserReportImplToJson(_$UserReportImpl instance) =>
    <String, dynamic>{
      'userReportID': instance.userReportID,
      'reporterID': instance.reporterID,
      'reportedUserID': instance.reportedUserID,
      'reasonCategoryID': instance.reasonCategoryID,
      'reportReply': instance.reportReply,
      'details': instance.details,
      'timeStamp': instance.timeStamp,
      'userReportStatus': instance.userReportStatus,
    };
