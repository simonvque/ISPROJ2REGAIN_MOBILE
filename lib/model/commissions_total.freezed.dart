// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commissions_total.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommissionsTotal _$CommissionsTotalFromJson(Map<String, dynamic> json) {
  return _CommissionsTotal.fromJson(json);
}

/// @nodoc
mixin _$CommissionsTotal {
  String get totalBal => throw _privateConstructorUsedError;
  set totalBal(String value) => throw _privateConstructorUsedError;
  List<CommissionsModel>? get commsList => throw _privateConstructorUsedError;
  set commsList(List<CommissionsModel>? value) =>
      throw _privateConstructorUsedError;

  /// Serializes this CommissionsTotal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommissionsTotal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommissionsTotalCopyWith<CommissionsTotal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionsTotalCopyWith<$Res> {
  factory $CommissionsTotalCopyWith(
          CommissionsTotal value, $Res Function(CommissionsTotal) then) =
      _$CommissionsTotalCopyWithImpl<$Res, CommissionsTotal>;
  @useResult
  $Res call({String totalBal, List<CommissionsModel>? commsList});
}

/// @nodoc
class _$CommissionsTotalCopyWithImpl<$Res, $Val extends CommissionsTotal>
    implements $CommissionsTotalCopyWith<$Res> {
  _$CommissionsTotalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommissionsTotal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBal = null,
    Object? commsList = freezed,
  }) {
    return _then(_value.copyWith(
      totalBal: null == totalBal
          ? _value.totalBal
          : totalBal // ignore: cast_nullable_to_non_nullable
              as String,
      commsList: freezed == commsList
          ? _value.commsList
          : commsList // ignore: cast_nullable_to_non_nullable
              as List<CommissionsModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommissionsTotalImplCopyWith<$Res>
    implements $CommissionsTotalCopyWith<$Res> {
  factory _$$CommissionsTotalImplCopyWith(_$CommissionsTotalImpl value,
          $Res Function(_$CommissionsTotalImpl) then) =
      __$$CommissionsTotalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String totalBal, List<CommissionsModel>? commsList});
}

/// @nodoc
class __$$CommissionsTotalImplCopyWithImpl<$Res>
    extends _$CommissionsTotalCopyWithImpl<$Res, _$CommissionsTotalImpl>
    implements _$$CommissionsTotalImplCopyWith<$Res> {
  __$$CommissionsTotalImplCopyWithImpl(_$CommissionsTotalImpl _value,
      $Res Function(_$CommissionsTotalImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommissionsTotal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBal = null,
    Object? commsList = freezed,
  }) {
    return _then(_$CommissionsTotalImpl(
      totalBal: null == totalBal
          ? _value.totalBal
          : totalBal // ignore: cast_nullable_to_non_nullable
              as String,
      commsList: freezed == commsList
          ? _value.commsList
          : commsList // ignore: cast_nullable_to_non_nullable
              as List<CommissionsModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionsTotalImpl implements _CommissionsTotal {
  _$CommissionsTotalImpl({required this.totalBal, this.commsList});

  factory _$CommissionsTotalImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionsTotalImplFromJson(json);

  @override
  String totalBal;
  @override
  List<CommissionsModel>? commsList;

  @override
  String toString() {
    return 'CommissionsTotal(totalBal: $totalBal, commsList: $commsList)';
  }

  /// Create a copy of CommissionsTotal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionsTotalImplCopyWith<_$CommissionsTotalImpl> get copyWith =>
      __$$CommissionsTotalImplCopyWithImpl<_$CommissionsTotalImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionsTotalImplToJson(
      this,
    );
  }
}

abstract class _CommissionsTotal implements CommissionsTotal {
  factory _CommissionsTotal(
      {required String totalBal,
      List<CommissionsModel>? commsList}) = _$CommissionsTotalImpl;

  factory _CommissionsTotal.fromJson(Map<String, dynamic> json) =
      _$CommissionsTotalImpl.fromJson;

  @override
  String get totalBal;
  set totalBal(String value);
  @override
  List<CommissionsModel>? get commsList;
  set commsList(List<CommissionsModel>? value);

  /// Create a copy of CommissionsTotal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionsTotalImplCopyWith<_$CommissionsTotalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
