// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListingReportImpl _$$ListingReportImplFromJson(Map<String, dynamic> json) =>
    _$ListingReportImpl(
      reportID: (json['reportID'] as num?)?.toInt(),
      reporterID: (json['reporterID'] as num).toInt(),
      reportedListingID: (json['reportedListingID'] as num).toInt(),
      reasonCategoryID: (json['reasonCategoryID'] as num).toInt(),
      reportReply: json['reportReply'] as String?,
      details: json['details'] as String?,
      timeStamp: json['timeStamp'] as String?,
      reportStatus: json['reportStatus'] as String?,
    );

Map<String, dynamic> _$$ListingReportImplToJson(_$ListingReportImpl instance) =>
    <String, dynamic>{
      'reportID': instance.reportID,
      'reporterID': instance.reporterID,
      'reportedListingID': instance.reportedListingID,
      'reasonCategoryID': instance.reasonCategoryID,
      'reportReply': instance.reportReply,
      'details': instance.details,
      'timeStamp': instance.timeStamp,
      'reportStatus': instance.reportStatus,
    };
