// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserReport _$UserReportFromJson(Map<String, dynamic> json) {
  return _UserReport.fromJson(json);
}

/// @nodoc
mixin _$UserReport {
  int? get userReportID => throw _privateConstructorUsedError;
  int get reporterID => throw _privateConstructorUsedError;
  int get reportedUserID => throw _privateConstructorUsedError;
  int get reasonCategoryID => throw _privateConstructorUsedError;
  String? get reportReply => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  String? get timeStamp => throw _privateConstructorUsedError;
  String? get userReportStatus => throw _privateConstructorUsedError;

  /// Serializes this UserReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserReportCopyWith<UserReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReportCopyWith<$Res> {
  factory $UserReportCopyWith(
          UserReport value, $Res Function(UserReport) then) =
      _$UserReportCopyWithImpl<$Res, UserReport>;
  @useResult
  $Res call(
      {int? userReportID,
      int reporterID,
      int reportedUserID,
      int reasonCategoryID,
      String? reportReply,
      String? details,
      String? timeStamp,
      String? userReportStatus});
}

/// @nodoc
class _$UserReportCopyWithImpl<$Res, $Val extends UserReport>
    implements $UserReportCopyWith<$Res> {
  _$UserReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userReportID = freezed,
    Object? reporterID = null,
    Object? reportedUserID = null,
    Object? reasonCategoryID = null,
    Object? reportReply = freezed,
    Object? details = freezed,
    Object? timeStamp = freezed,
    Object? userReportStatus = freezed,
  }) {
    return _then(_value.copyWith(
      userReportID: freezed == userReportID
          ? _value.userReportID
          : userReportID // ignore: cast_nullable_to_non_nullable
              as int?,
      reporterID: null == reporterID
          ? _value.reporterID
          : reporterID // ignore: cast_nullable_to_non_nullable
              as int,
      reportedUserID: null == reportedUserID
          ? _value.reportedUserID
          : reportedUserID // ignore: cast_nullable_to_non_nullable
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
      userReportStatus: freezed == userReportStatus
          ? _value.userReportStatus
          : userReportStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserReportImplCopyWith<$Res>
    implements $UserReportCopyWith<$Res> {
  factory _$$UserReportImplCopyWith(
          _$UserReportImpl value, $Res Function(_$UserReportImpl) then) =
      __$$UserReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? userReportID,
      int reporterID,
      int reportedUserID,
      int reasonCategoryID,
      String? reportReply,
      String? details,
      String? timeStamp,
      String? userReportStatus});
}

/// @nodoc
class __$$UserReportImplCopyWithImpl<$Res>
    extends _$UserReportCopyWithImpl<$Res, _$UserReportImpl>
    implements _$$UserReportImplCopyWith<$Res> {
  __$$UserReportImplCopyWithImpl(
      _$UserReportImpl _value, $Res Function(_$UserReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userReportID = freezed,
    Object? reporterID = null,
    Object? reportedUserID = null,
    Object? reasonCategoryID = null,
    Object? reportReply = freezed,
    Object? details = freezed,
    Object? timeStamp = freezed,
    Object? userReportStatus = freezed,
  }) {
    return _then(_$UserReportImpl(
      userReportID: freezed == userReportID
          ? _value.userReportID
          : userReportID // ignore: cast_nullable_to_non_nullable
              as int?,
      reporterID: null == reporterID
          ? _value.reporterID
          : reporterID // ignore: cast_nullable_to_non_nullable
              as int,
      reportedUserID: null == reportedUserID
          ? _value.reportedUserID
          : reportedUserID // ignore: cast_nullable_to_non_nullable
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
      userReportStatus: freezed == userReportStatus
          ? _value.userReportStatus
          : userReportStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserReportImpl implements _UserReport {
  const _$UserReportImpl(
      {this.userReportID,
      required this.reporterID,
      required this.reportedUserID,
      required this.reasonCategoryID,
      this.reportReply,
      this.details,
      this.timeStamp,
      this.userReportStatus});

  factory _$UserReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserReportImplFromJson(json);

  @override
  final int? userReportID;
  @override
  final int reporterID;
  @override
  final int reportedUserID;
  @override
  final int reasonCategoryID;
  @override
  final String? reportReply;
  @override
  final String? details;
  @override
  final String? timeStamp;
  @override
  final String? userReportStatus;

  @override
  String toString() {
    return 'UserReport(userReportID: $userReportID, reporterID: $reporterID, reportedUserID: $reportedUserID, reasonCategoryID: $reasonCategoryID, reportReply: $reportReply, details: $details, timeStamp: $timeStamp, userReportStatus: $userReportStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserReportImpl &&
            (identical(other.userReportID, userReportID) ||
                other.userReportID == userReportID) &&
            (identical(other.reporterID, reporterID) ||
                other.reporterID == reporterID) &&
            (identical(other.reportedUserID, reportedUserID) ||
                other.reportedUserID == reportedUserID) &&
            (identical(other.reasonCategoryID, reasonCategoryID) ||
                other.reasonCategoryID == reasonCategoryID) &&
            (identical(other.reportReply, reportReply) ||
                other.reportReply == reportReply) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.userReportStatus, userReportStatus) ||
                other.userReportStatus == userReportStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userReportID,
      reporterID,
      reportedUserID,
      reasonCategoryID,
      reportReply,
      details,
      timeStamp,
      userReportStatus);

  /// Create a copy of UserReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserReportImplCopyWith<_$UserReportImpl> get copyWith =>
      __$$UserReportImplCopyWithImpl<_$UserReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserReportImplToJson(
      this,
    );
  }
}

abstract class _UserReport implements UserReport {
  const factory _UserReport(
      {final int? userReportID,
      required final int reporterID,
      required final int reportedUserID,
      required final int reasonCategoryID,
      final String? reportReply,
      final String? details,
      final String? timeStamp,
      final String? userReportStatus}) = _$UserReportImpl;

  factory _UserReport.fromJson(Map<String, dynamic> json) =
      _$UserReportImpl.fromJson;

  @override
  int? get userReportID;
  @override
  int get reporterID;
  @override
  int get reportedUserID;
  @override
  int get reasonCategoryID;
  @override
  String? get reportReply;
  @override
  String? get details;
  @override
  String? get timeStamp;
  @override
  String? get userReportStatus;

  /// Create a copy of UserReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserReportImplCopyWith<_$UserReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
