import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_report.freezed.dart';
part 'user_report.g.dart';

@freezed
class UserReport with _$UserReport {
  const factory UserReport({
    int? userReportID,
    required int reporterID,
    required int reportedUserID,
    required int reasonCategoryID,
    String? reportReply,
    String? details,
    String? timeStamp,
    String? userReportStatus,
  }) = _UserReport;

  factory UserReport.fromJson(Map<String, dynamic> json) =>
      _$UserReportFromJson(json);
}
