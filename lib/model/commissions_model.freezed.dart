// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commissions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommissionsModel _$CommissionsModelFromJson(Map<String, dynamic> json) {
  return _CommissionsModel.fromJson(json);
}

/// @nodoc
mixin _$CommissionsModel {
  int? get commissionID => throw _privateConstructorUsedError;
  set commissionID(int? value) => throw _privateConstructorUsedError;
  int get userID => throw _privateConstructorUsedError;
  set userID(int value) => throw _privateConstructorUsedError;
  OrderModel? get order => throw _privateConstructorUsedError;
  set order(OrderModel? value) => throw _privateConstructorUsedError;
  String get commissionBalance => throw _privateConstructorUsedError;
  set commissionBalance(String value) => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  set status(String? value) => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;
  set remarks(String? value) => throw _privateConstructorUsedError;
  PaymentModel? get payment => throw _privateConstructorUsedError;
  set payment(PaymentModel? value) => throw _privateConstructorUsedError;

  /// Serializes this CommissionsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommissionsModelCopyWith<CommissionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionsModelCopyWith<$Res> {
  factory $CommissionsModelCopyWith(
          CommissionsModel value, $Res Function(CommissionsModel) then) =
      _$CommissionsModelCopyWithImpl<$Res, CommissionsModel>;
  @useResult
  $Res call(
      {int? commissionID,
      int userID,
      OrderModel? order,
      String commissionBalance,
      String? status,
      String? remarks,
      PaymentModel? payment});

  $OrderModelCopyWith<$Res>? get order;
  $PaymentModelCopyWith<$Res>? get payment;
}

/// @nodoc
class _$CommissionsModelCopyWithImpl<$Res, $Val extends CommissionsModel>
    implements $CommissionsModelCopyWith<$Res> {
  _$CommissionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commissionID = freezed,
    Object? userID = null,
    Object? order = freezed,
    Object? commissionBalance = null,
    Object? status = freezed,
    Object? remarks = freezed,
    Object? payment = freezed,
  }) {
    return _then(_value.copyWith(
      commissionID: freezed == commissionID
          ? _value.commissionID
          : commissionID // ignore: cast_nullable_to_non_nullable
              as int?,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
      commissionBalance: null == commissionBalance
          ? _value.commissionBalance
          : commissionBalance // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      payment: freezed == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentModel?,
    ) as $Val);
  }

  /// Create a copy of CommissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<$Res>? get order {
    if (_value.order == null) {
      return null;
    }

    return $OrderModelCopyWith<$Res>(_value.order!, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  /// Create a copy of CommissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentModelCopyWith<$Res>? get payment {
    if (_value.payment == null) {
      return null;
    }

    return $PaymentModelCopyWith<$Res>(_value.payment!, (value) {
      return _then(_value.copyWith(payment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommissionsModelImplCopyWith<$Res>
    implements $CommissionsModelCopyWith<$Res> {
  factory _$$CommissionsModelImplCopyWith(_$CommissionsModelImpl value,
          $Res Function(_$CommissionsModelImpl) then) =
      __$$CommissionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? commissionID,
      int userID,
      OrderModel? order,
      String commissionBalance,
      String? status,
      String? remarks,
      PaymentModel? payment});

  @override
  $OrderModelCopyWith<$Res>? get order;
  @override
  $PaymentModelCopyWith<$Res>? get payment;
}

/// @nodoc
class __$$CommissionsModelImplCopyWithImpl<$Res>
    extends _$CommissionsModelCopyWithImpl<$Res, _$CommissionsModelImpl>
    implements _$$CommissionsModelImplCopyWith<$Res> {
  __$$CommissionsModelImplCopyWithImpl(_$CommissionsModelImpl _value,
      $Res Function(_$CommissionsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commissionID = freezed,
    Object? userID = null,
    Object? order = freezed,
    Object? commissionBalance = null,
    Object? status = freezed,
    Object? remarks = freezed,
    Object? payment = freezed,
  }) {
    return _then(_$CommissionsModelImpl(
      commissionID: freezed == commissionID
          ? _value.commissionID
          : commissionID // ignore: cast_nullable_to_non_nullable
              as int?,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
      commissionBalance: null == commissionBalance
          ? _value.commissionBalance
          : commissionBalance // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      payment: freezed == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionsModelImpl implements _CommissionsModel {
  _$CommissionsModelImpl(
      {this.commissionID,
      required this.userID,
      required this.order,
      required this.commissionBalance,
      this.status,
      this.remarks,
      this.payment});

  factory _$CommissionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionsModelImplFromJson(json);

  @override
  int? commissionID;
  @override
  int userID;
  @override
  OrderModel? order;
  @override
  String commissionBalance;
  @override
  String? status;
  @override
  String? remarks;
  @override
  PaymentModel? payment;

  @override
  String toString() {
    return 'CommissionsModel(commissionID: $commissionID, userID: $userID, order: $order, commissionBalance: $commissionBalance, status: $status, remarks: $remarks, payment: $payment)';
  }

  /// Create a copy of CommissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionsModelImplCopyWith<_$CommissionsModelImpl> get copyWith =>
      __$$CommissionsModelImplCopyWithImpl<_$CommissionsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionsModelImplToJson(
      this,
    );
  }
}

abstract class _CommissionsModel implements CommissionsModel {
  factory _CommissionsModel(
      {int? commissionID,
      required int userID,
      required OrderModel? order,
      required String commissionBalance,
      String? status,
      String? remarks,
      PaymentModel? payment}) = _$CommissionsModelImpl;

  factory _CommissionsModel.fromJson(Map<String, dynamic> json) =
      _$CommissionsModelImpl.fromJson;

  @override
  int? get commissionID;
  set commissionID(int? value);
  @override
  int get userID;
  set userID(int value);
  @override
  OrderModel? get order;
  set order(OrderModel? value);
  @override
  String get commissionBalance;
  set commissionBalance(String value);
  @override
  String? get status;
  set status(String? value);
  @override
  String? get remarks;
  set remarks(String? value);
  @override
  PaymentModel? get payment;
  set payment(PaymentModel? value);

  /// Create a copy of CommissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionsModelImplCopyWith<_$CommissionsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
