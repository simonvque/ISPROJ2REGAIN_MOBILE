// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderLog _$OrderLogFromJson(Map<String, dynamic> json) {
  return _OrderLog.fromJson(json);
}

/// @nodoc
mixin _$OrderLog {
  int? get trackingID => throw _privateConstructorUsedError;
  set trackingID(int? value) => throw _privateConstructorUsedError;
  int get orderID => throw _privateConstructorUsedError;
  set orderID(int value) => throw _privateConstructorUsedError;
  DateTime? get deliveryDate => throw _privateConstructorUsedError;
  set deliveryDate(DateTime? value) => throw _privateConstructorUsedError;
  String get prevStatus => throw _privateConstructorUsedError;
  set prevStatus(String value) => throw _privateConstructorUsedError;
  int get updatedByUserID => throw _privateConstructorUsedError;
  set updatedByUserID(int value) => throw _privateConstructorUsedError;
  DateTime get timeStamp => throw _privateConstructorUsedError;
  set timeStamp(DateTime value) => throw _privateConstructorUsedError;

  /// Serializes this OrderLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderLogCopyWith<OrderLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderLogCopyWith<$Res> {
  factory $OrderLogCopyWith(OrderLog value, $Res Function(OrderLog) then) =
      _$OrderLogCopyWithImpl<$Res, OrderLog>;
  @useResult
  $Res call(
      {int? trackingID,
      int orderID,
      DateTime? deliveryDate,
      String prevStatus,
      int updatedByUserID,
      DateTime timeStamp});
}

/// @nodoc
class _$OrderLogCopyWithImpl<$Res, $Val extends OrderLog>
    implements $OrderLogCopyWith<$Res> {
  _$OrderLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackingID = freezed,
    Object? orderID = null,
    Object? deliveryDate = freezed,
    Object? prevStatus = null,
    Object? updatedByUserID = null,
    Object? timeStamp = null,
  }) {
    return _then(_value.copyWith(
      trackingID: freezed == trackingID
          ? _value.trackingID
          : trackingID // ignore: cast_nullable_to_non_nullable
              as int?,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      prevStatus: null == prevStatus
          ? _value.prevStatus
          : prevStatus // ignore: cast_nullable_to_non_nullable
              as String,
      updatedByUserID: null == updatedByUserID
          ? _value.updatedByUserID
          : updatedByUserID // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderLogImplCopyWith<$Res>
    implements $OrderLogCopyWith<$Res> {
  factory _$$OrderLogImplCopyWith(
          _$OrderLogImpl value, $Res Function(_$OrderLogImpl) then) =
      __$$OrderLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? trackingID,
      int orderID,
      DateTime? deliveryDate,
      String prevStatus,
      int updatedByUserID,
      DateTime timeStamp});
}

/// @nodoc
class __$$OrderLogImplCopyWithImpl<$Res>
    extends _$OrderLogCopyWithImpl<$Res, _$OrderLogImpl>
    implements _$$OrderLogImplCopyWith<$Res> {
  __$$OrderLogImplCopyWithImpl(
      _$OrderLogImpl _value, $Res Function(_$OrderLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackingID = freezed,
    Object? orderID = null,
    Object? deliveryDate = freezed,
    Object? prevStatus = null,
    Object? updatedByUserID = null,
    Object? timeStamp = null,
  }) {
    return _then(_$OrderLogImpl(
      trackingID: freezed == trackingID
          ? _value.trackingID
          : trackingID // ignore: cast_nullable_to_non_nullable
              as int?,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      prevStatus: null == prevStatus
          ? _value.prevStatus
          : prevStatus // ignore: cast_nullable_to_non_nullable
              as String,
      updatedByUserID: null == updatedByUserID
          ? _value.updatedByUserID
          : updatedByUserID // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderLogImpl implements _OrderLog {
  _$OrderLogImpl(
      {this.trackingID,
      required this.orderID,
      this.deliveryDate,
      required this.prevStatus,
      required this.updatedByUserID,
      required this.timeStamp});

  factory _$OrderLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderLogImplFromJson(json);

  @override
  int? trackingID;
  @override
  int orderID;
  @override
  DateTime? deliveryDate;
  @override
  String prevStatus;
  @override
  int updatedByUserID;
  @override
  DateTime timeStamp;

  @override
  String toString() {
    return 'OrderLog(trackingID: $trackingID, orderID: $orderID, deliveryDate: $deliveryDate, prevStatus: $prevStatus, updatedByUserID: $updatedByUserID, timeStamp: $timeStamp)';
  }

  /// Create a copy of OrderLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderLogImplCopyWith<_$OrderLogImpl> get copyWith =>
      __$$OrderLogImplCopyWithImpl<_$OrderLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderLogImplToJson(
      this,
    );
  }
}

abstract class _OrderLog implements OrderLog {
  factory _OrderLog(
      {int? trackingID,
      required int orderID,
      DateTime? deliveryDate,
      required String prevStatus,
      required int updatedByUserID,
      required DateTime timeStamp}) = _$OrderLogImpl;

  factory _OrderLog.fromJson(Map<String, dynamic> json) =
      _$OrderLogImpl.fromJson;

  @override
  int? get trackingID;
  set trackingID(int? value);
  @override
  int get orderID;
  set orderID(int value);
  @override
  DateTime? get deliveryDate;
  set deliveryDate(DateTime? value);
  @override
  String get prevStatus;
  set prevStatus(String value);
  @override
  int get updatedByUserID;
  set updatedByUserID(int value);
  @override
  DateTime get timeStamp;
  set timeStamp(DateTime value);

  /// Create a copy of OrderLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderLogImplCopyWith<_$OrderLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
