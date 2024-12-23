// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return _Rating.fromJson(json);
}

/// @nodoc
mixin _$Rating {
  int get ratingId => throw _privateConstructorUsedError;
  int get ratedUserId => throw _privateConstructorUsedError;
  int get ratedByUserId => throw _privateConstructorUsedError;
  int get rateValue => throw _privateConstructorUsedError;
  String get comments => throw _privateConstructorUsedError;
  DateTime get dateCreated => throw _privateConstructorUsedError;
  DateTime? get dateEdited => throw _privateConstructorUsedError;

  /// Serializes this Rating to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatingCopyWith<Rating> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingCopyWith<$Res> {
  factory $RatingCopyWith(Rating value, $Res Function(Rating) then) =
      _$RatingCopyWithImpl<$Res, Rating>;
  @useResult
  $Res call(
      {int ratingId,
      int ratedUserId,
      int ratedByUserId,
      int rateValue,
      String comments,
      DateTime dateCreated,
      DateTime? dateEdited});
}

/// @nodoc
class _$RatingCopyWithImpl<$Res, $Val extends Rating>
    implements $RatingCopyWith<$Res> {
  _$RatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratingId = null,
    Object? ratedUserId = null,
    Object? ratedByUserId = null,
    Object? rateValue = null,
    Object? comments = null,
    Object? dateCreated = null,
    Object? dateEdited = freezed,
  }) {
    return _then(_value.copyWith(
      ratingId: null == ratingId
          ? _value.ratingId
          : ratingId // ignore: cast_nullable_to_non_nullable
              as int,
      ratedUserId: null == ratedUserId
          ? _value.ratedUserId
          : ratedUserId // ignore: cast_nullable_to_non_nullable
              as int,
      ratedByUserId: null == ratedByUserId
          ? _value.ratedByUserId
          : ratedByUserId // ignore: cast_nullable_to_non_nullable
              as int,
      rateValue: null == rateValue
          ? _value.rateValue
          : rateValue // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEdited: freezed == dateEdited
          ? _value.dateEdited
          : dateEdited // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingImplCopyWith<$Res> implements $RatingCopyWith<$Res> {
  factory _$$RatingImplCopyWith(
          _$RatingImpl value, $Res Function(_$RatingImpl) then) =
      __$$RatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int ratingId,
      int ratedUserId,
      int ratedByUserId,
      int rateValue,
      String comments,
      DateTime dateCreated,
      DateTime? dateEdited});
}

/// @nodoc
class __$$RatingImplCopyWithImpl<$Res>
    extends _$RatingCopyWithImpl<$Res, _$RatingImpl>
    implements _$$RatingImplCopyWith<$Res> {
  __$$RatingImplCopyWithImpl(
      _$RatingImpl _value, $Res Function(_$RatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratingId = null,
    Object? ratedUserId = null,
    Object? ratedByUserId = null,
    Object? rateValue = null,
    Object? comments = null,
    Object? dateCreated = null,
    Object? dateEdited = freezed,
  }) {
    return _then(_$RatingImpl(
      ratingId: null == ratingId
          ? _value.ratingId
          : ratingId // ignore: cast_nullable_to_non_nullable
              as int,
      ratedUserId: null == ratedUserId
          ? _value.ratedUserId
          : ratedUserId // ignore: cast_nullable_to_non_nullable
              as int,
      ratedByUserId: null == ratedByUserId
          ? _value.ratedByUserId
          : ratedByUserId // ignore: cast_nullable_to_non_nullable
              as int,
      rateValue: null == rateValue
          ? _value.rateValue
          : rateValue // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEdited: freezed == dateEdited
          ? _value.dateEdited
          : dateEdited // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingImpl implements _Rating {
  const _$RatingImpl(
      {required this.ratingId,
      required this.ratedUserId,
      required this.ratedByUserId,
      required this.rateValue,
      required this.comments,
      required this.dateCreated,
      this.dateEdited});

  factory _$RatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingImplFromJson(json);

  @override
  final int ratingId;
  @override
  final int ratedUserId;
  @override
  final int ratedByUserId;
  @override
  final int rateValue;
  @override
  final String comments;
  @override
  final DateTime dateCreated;
  @override
  final DateTime? dateEdited;

  @override
  String toString() {
    return 'Rating(ratingId: $ratingId, ratedUserId: $ratedUserId, ratedByUserId: $ratedByUserId, rateValue: $rateValue, comments: $comments, dateCreated: $dateCreated, dateEdited: $dateEdited)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingImpl &&
            (identical(other.ratingId, ratingId) ||
                other.ratingId == ratingId) &&
            (identical(other.ratedUserId, ratedUserId) ||
                other.ratedUserId == ratedUserId) &&
            (identical(other.ratedByUserId, ratedByUserId) ||
                other.ratedByUserId == ratedByUserId) &&
            (identical(other.rateValue, rateValue) ||
                other.rateValue == rateValue) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.dateEdited, dateEdited) ||
                other.dateEdited == dateEdited));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ratingId, ratedUserId,
      ratedByUserId, rateValue, comments, dateCreated, dateEdited);

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingImplCopyWith<_$RatingImpl> get copyWith =>
      __$$RatingImplCopyWithImpl<_$RatingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingImplToJson(
      this,
    );
  }
}

abstract class _Rating implements Rating {
  const factory _Rating(
      {required final int ratingId,
      required final int ratedUserId,
      required final int ratedByUserId,
      required final int rateValue,
      required final String comments,
      required final DateTime dateCreated,
      final DateTime? dateEdited}) = _$RatingImpl;

  factory _Rating.fromJson(Map<String, dynamic> json) = _$RatingImpl.fromJson;

  @override
  int get ratingId;
  @override
  int get ratedUserId;
  @override
  int get ratedByUserId;
  @override
  int get rateValue;
  @override
  String get comments;
  @override
  DateTime get dateCreated;
  @override
  DateTime? get dateEdited;

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingImplCopyWith<_$RatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
