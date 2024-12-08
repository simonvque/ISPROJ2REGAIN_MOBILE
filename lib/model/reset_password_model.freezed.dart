// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResetPasswordModel _$ResetPasswordModelFromJson(Map<String, dynamic> json) {
  return _ResetPasswordModel.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordModel {
  String get otp => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  DateTime get expirationTime => throw _privateConstructorUsedError;
  bool get isUsed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPasswordModelCopyWith<ResetPasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordModelCopyWith<$Res> {
  factory $ResetPasswordModelCopyWith(
          ResetPasswordModel value, $Res Function(ResetPasswordModel) then) =
      _$ResetPasswordModelCopyWithImpl<$Res, ResetPasswordModel>;
  @useResult
  $Res call({String otp, String email, DateTime expirationTime, bool isUsed});
}

/// @nodoc
class _$ResetPasswordModelCopyWithImpl<$Res, $Val extends ResetPasswordModel>
    implements $ResetPasswordModelCopyWith<$Res> {
  _$ResetPasswordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
    Object? email = null,
    Object? expirationTime = null,
    Object? isUsed = null,
  }) {
    return _then(_value.copyWith(
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      expirationTime: null == expirationTime
          ? _value.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordModelImplCopyWith<$Res>
    implements $ResetPasswordModelCopyWith<$Res> {
  factory _$$ResetPasswordModelImplCopyWith(_$ResetPasswordModelImpl value,
          $Res Function(_$ResetPasswordModelImpl) then) =
      __$$ResetPasswordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String otp, String email, DateTime expirationTime, bool isUsed});
}

/// @nodoc
class __$$ResetPasswordModelImplCopyWithImpl<$Res>
    extends _$ResetPasswordModelCopyWithImpl<$Res, _$ResetPasswordModelImpl>
    implements _$$ResetPasswordModelImplCopyWith<$Res> {
  __$$ResetPasswordModelImplCopyWithImpl(_$ResetPasswordModelImpl _value,
      $Res Function(_$ResetPasswordModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
    Object? email = null,
    Object? expirationTime = null,
    Object? isUsed = null,
  }) {
    return _then(_$ResetPasswordModelImpl(
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      expirationTime: null == expirationTime
          ? _value.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPasswordModelImpl implements _ResetPasswordModel {
  const _$ResetPasswordModelImpl(
      {required this.otp,
      required this.email,
      required this.expirationTime,
      required this.isUsed});

  factory _$ResetPasswordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordModelImplFromJson(json);

  @override
  final String otp;
  @override
  final String email;
  @override
  final DateTime expirationTime;
  @override
  final bool isUsed;

  @override
  String toString() {
    return 'ResetPasswordModel(otp: $otp, email: $email, expirationTime: $expirationTime, isUsed: $isUsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordModelImpl &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.expirationTime, expirationTime) ||
                other.expirationTime == expirationTime) &&
            (identical(other.isUsed, isUsed) || other.isUsed == isUsed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, otp, email, expirationTime, isUsed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordModelImplCopyWith<_$ResetPasswordModelImpl> get copyWith =>
      __$$ResetPasswordModelImplCopyWithImpl<_$ResetPasswordModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordModelImplToJson(
      this,
    );
  }
}

abstract class _ResetPasswordModel implements ResetPasswordModel {
  const factory _ResetPasswordModel(
      {required final String otp,
      required final String email,
      required final DateTime expirationTime,
      required final bool isUsed}) = _$ResetPasswordModelImpl;

  factory _ResetPasswordModel.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordModelImpl.fromJson;

  @override
  String get otp;
  @override
  String get email;
  @override
  DateTime get expirationTime;
  @override
  bool get isUsed;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordModelImplCopyWith<_$ResetPasswordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
