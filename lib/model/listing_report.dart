import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing_report.freezed.dart';
part 'listing_report.g.dart';

@freezed
class ListingReport with _$ListingReport {
  const factory ListingReport({
    int? reportID,
    required int reporterID,
    required int reportedListingID,
    required int reasonCategoryID,
    String? reportReply,
    String? details,
    String? timeStamp,
    String? reportStatus,
  }) = _ListingReport;

  factory ListingReport.fromJson(Map<String, dynamic> json) =>
      _$ListingReportFromJson(json);
}
