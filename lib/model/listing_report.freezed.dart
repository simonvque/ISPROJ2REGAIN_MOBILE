// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListingReport _$ListingReportFromJson(Map<String, dynamic> json) {
  return _ListingReport.fromJson(json);
}

/// @nodoc
mixin _$ListingReport {
  int? get reportID => throw _privateConstructorUsedError;
  int get reporterID => throw _privateConstructorUsedError;
  int get reportedListingID => throw _privateConstructorUsedError;
  int get reasonCategoryID => throw _privateConstructorUsedError;
  String? get reportReply => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  String? get timeStamp => throw _privateConstructorUsedError;
  String? get reportStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListingReportCopyWith<ListingReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingReportCopyWith<$Res> {
  factory $ListingReportCopyWith(
          ListingReport value, $Res Function(ListingReport) then) =
      _$ListingReportCopyWithImpl<$Res, ListingReport>;
  @useResult
  $Res call(
      {int? reportID,
      int reporterID,
      int reportedListingID,
      int reasonCategoryID,
      String? reportReply,
      String? details,
      String? timeStamp,
      String? reportStatus});
}

/// @nodoc
class _$ListingReportCopyWithImpl<$Res, $Val extends ListingReport>
    implements $ListingReportCopyWith<$Res> {
  _$ListingReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportID = freezed,
    Object? reporterID = null,
    Object? reportedListingID = null,
    Object? reasonCategoryID = null,
    Object? reportReply = freezed,
    Object? details = freezed,
    Object? timeStamp = freezed,
    Object? reportStatus = freezed,
  }) {
    return _then(_value.copyWith(
      reportID: freezed == reportID
          ? _value.reportID
          : reportID // ignore: cast_nullable_to_non_nullable
              as int?,
      reporterID: null == reporterID
          ? _value.reporterID
          : reporterID // ignore: cast_nullable_to_non_nullable
              as int,
      reportedListingID: null == reportedListingID
          ? _value.reportedListingID
          : reportedListingID // ignore: cast_nullable_to_non_nullable
              as int,
      reasonCategoryID: null == reasonCategoryID
          ? _value.reasonCategoryID
          : reasonCategoryID // ignore: cast_nullable_to_non_nullable
              as int,
      reportReply: freezed == reportReply
          ? _value.reportReply
          : reportReply // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      reportStatus: freezed == reportStatus
          ? _value.reportStatus
          : reportStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListingReportImplCopyWith<$Res>
    implements $ListingReportCopyWith<$Res> {
  factory _$$ListingReportImplCopyWith(
          _$ListingReportImpl value, $Res Function(_$ListingReportImpl) then) =
      __$$ListingReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? reportID,
      int reporterID,
      int reportedListingID,
      int reasonCategoryID,
      String? reportReply,
      String? details,
      String? timeStamp,
      String? reportStatus});
}

/// @nodoc
class __$$ListingReportImplCopyWithImpl<$Res>
    extends _$ListingReportCopyWithImpl<$Res, _$ListingReportImpl>
    implements _$$ListingReportImplCopyWith<$Res> {
  __$$ListingReportImplCopyWithImpl(
      _$ListingReportImpl _value, $Res Function(_$ListingReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportID = freezed,
    Object? reporterID = null,
    Object? reportedListingID = null,
    Object? reasonCategoryID = null,
    Object? reportReply = freezed,
    Object? details = freezed,
    Object? timeStamp = freezed,
    Object? reportStatus = freezed,
  }) {
    return _then(_$ListingReportImpl(
      reportID: freezed == reportID
          ? _value.reportID
          : reportID // ignore: cast_nullable_to_non_nullable
              as int?,
      reporterID: null == reporterID
          ? _value.reporterID
          : reporterID // ignore: cast_nullable_to_non_nullable
              as int,
      reportedListingID: null == reportedListingID
          ? _value.reportedListingID
          : reportedListingID // ignore: cast_nullable_to_non_nullable
              as int,
      reasonCategoryID: null == reasonCategoryID
          ? _value.reasonCategoryID
          : reasonCategoryID // ignore: cast_nullable_to_non_nullable
              as int,
      reportReply: freezed == reportReply
          ? _value.reportReply
          : reportReply // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      reportStatus: freezed == reportStatus
          ? _value.reportStatus
          : reportStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListingReportImpl implements _ListingReport {
  const _$ListingReportImpl(
      {this.reportID,
      required this.reporterID,
      required this.reportedListingID,
      required this.reasonCategoryID,
      this.reportReply,
      this.details,
      this.timeStamp,
      this.reportStatus});

  factory _$ListingReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListingReportImplFromJson(json);

  @override
  final int? reportID;
  @override
  final int reporterID;
  @override
  final int reportedListingID;
  @override
  final int reasonCategoryID;
  @override
  final String? reportReply;
  @override
  final String? details;
  @override
  final String? timeStamp;
  @override
  final String? reportStatus;

  @override
  String toString() {
    return 'ListingReport(reportID: $reportID, reporterID: $reporterID, reportedListingID: $reportedListingID, reasonCategoryID: $reasonCategoryID, reportReply: $reportReply, details: $details, timeStamp: $timeStamp, reportStatus: $reportStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListingReportImpl &&
            (identical(other.reportID, reportID) ||
                other.reportID == reportID) &&
            (identical(other.reporterID, reporterID) ||
                other.reporterID == reporterID) &&
            (identical(other.reportedListingID, reportedListingID) ||
                other.reportedListingID == reportedListingID) &&
            (identical(other.reasonCategoryID, reasonCategoryID) ||
                other.reasonCategoryID == reasonCategoryID) &&
            (identical(other.reportReply, reportReply) ||
                other.reportReply == reportReply) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.reportStatus, reportStatus) ||
                other.reportStatus == reportStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reportID,
      reporterID,
      reportedListingID,
      reasonCategoryID,
      reportReply,
      details,
      timeStamp,
      reportStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListingReportImplCopyWith<_$ListingReportImpl> get copyWith =>
      __$$ListingReportImplCopyWithImpl<_$ListingReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListingReportImplToJson(
      this,
    );
  }
}

abstract class _ListingReport implements ListingReport {
  const factory _ListingReport(
      {final int? reportID,
      required final int reporterID,
      required final int reportedListingID,
      required final int reasonCategoryID,
      final String? reportReply,
      final String? details,
      final String? timeStamp,
      final String? reportStatus}) = _$ListingReportImpl;

  factory _ListingReport.fromJson(Map<String, dynamic> json) =
      _$ListingReportImpl.fromJson;

  @override
  int? get reportID;
  @override
  int get reporterID;
  @override
  int get reportedListingID;
  @override
  int get reasonCategoryID;
  @override
  String? get reportReply;
  @override
  String? get details;
  @override
  String? get timeStamp;
  @override
  String? get reportStatus;
  @override
  @JsonKey(ignore: true)
  _$$ListingReportImplCopyWith<_$ListingReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
