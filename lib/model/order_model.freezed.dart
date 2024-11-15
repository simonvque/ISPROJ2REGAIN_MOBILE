// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  int? get orderID => throw _privateConstructorUsedError;
  set orderID(int? value) => throw _privateConstructorUsedError;
  int get productID => throw _privateConstructorUsedError;
  set productID(int value) => throw _privateConstructorUsedError;
  int get buyerID => throw _privateConstructorUsedError;
  set buyerID(int value) => throw _privateConstructorUsedError;
  DateTime? get orderDate => throw _privateConstructorUsedError;
  set orderDate(DateTime? value) => throw _privateConstructorUsedError;
  String get deliveryMethod => throw _privateConstructorUsedError;
  set deliveryMethod(String value) => throw _privateConstructorUsedError;
  DateTime get deliveryDate => throw _privateConstructorUsedError;
  set deliveryDate(DateTime value) => throw _privateConstructorUsedError;
  PaymentModel? get paymentMethod => throw _privateConstructorUsedError;
  set paymentMethod(PaymentModel? value) => throw _privateConstructorUsedError;
  String get totalAmount => throw _privateConstructorUsedError;
  set totalAmount(String value) => throw _privateConstructorUsedError;
  String get currentStatus => throw _privateConstructorUsedError;
  set currentStatus(String value) => throw _privateConstructorUsedError;
  int? get addressID => throw _privateConstructorUsedError;
  set addressID(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {int? orderID,
      int productID,
      int buyerID,
      DateTime? orderDate,
      String deliveryMethod,
      DateTime deliveryDate,
      PaymentModel? paymentMethod,
      String totalAmount,
      String currentStatus,
      int? addressID});

  $PaymentModelCopyWith<$Res>? get paymentMethod;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderID = freezed,
    Object? productID = null,
    Object? buyerID = null,
    Object? orderDate = freezed,
    Object? deliveryMethod = null,
    Object? deliveryDate = null,
    Object? paymentMethod = freezed,
    Object? totalAmount = null,
    Object? currentStatus = null,
    Object? addressID = freezed,
  }) {
    return _then(_value.copyWith(
      orderID: freezed == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int?,
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as int,
      buyerID: null == buyerID
          ? _value.buyerID
          : buyerID // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryMethod: null == deliveryMethod
          ? _value.deliveryMethod
          : deliveryMethod // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentModel?,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      currentStatus: null == currentStatus
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      addressID: freezed == addressID
          ? _value.addressID
          : addressID // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentModelCopyWith<$Res>? get paymentMethod {
    if (_value.paymentMethod == null) {
      return null;
    }

    return $PaymentModelCopyWith<$Res>(_value.paymentMethod!, (value) {
      return _then(_value.copyWith(paymentMethod: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? orderID,
      int productID,
      int buyerID,
      DateTime? orderDate,
      String deliveryMethod,
      DateTime deliveryDate,
      PaymentModel? paymentMethod,
      String totalAmount,
      String currentStatus,
      int? addressID});

  @override
  $PaymentModelCopyWith<$Res>? get paymentMethod;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderID = freezed,
    Object? productID = null,
    Object? buyerID = null,
    Object? orderDate = freezed,
    Object? deliveryMethod = null,
    Object? deliveryDate = null,
    Object? paymentMethod = freezed,
    Object? totalAmount = null,
    Object? currentStatus = null,
    Object? addressID = freezed,
  }) {
    return _then(_$OrderModelImpl(
      orderID: freezed == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int?,
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as int,
      buyerID: null == buyerID
          ? _value.buyerID
          : buyerID // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryMethod: null == deliveryMethod
          ? _value.deliveryMethod
          : deliveryMethod // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentModel?,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      currentStatus: null == currentStatus
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      addressID: freezed == addressID
          ? _value.addressID
          : addressID // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  _$OrderModelImpl(
      {this.orderID,
      required this.productID,
      required this.buyerID,
      this.orderDate,
      required this.deliveryMethod,
      required this.deliveryDate,
      this.paymentMethod,
      required this.totalAmount,
      required this.currentStatus,
      this.addressID});

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  int? orderID;
  @override
  int productID;
  @override
  int buyerID;
  @override
  DateTime? orderDate;
  @override
  String deliveryMethod;
  @override
  DateTime deliveryDate;
  @override
  PaymentModel? paymentMethod;
  @override
  String totalAmount;
  @override
  String currentStatus;
  @override
  int? addressID;

  @override
  String toString() {
    return 'OrderModel(orderID: $orderID, productID: $productID, buyerID: $buyerID, orderDate: $orderDate, deliveryMethod: $deliveryMethod, deliveryDate: $deliveryDate, paymentMethod: $paymentMethod, totalAmount: $totalAmount, currentStatus: $currentStatus, addressID: $addressID)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  factory _OrderModel(
      {int? orderID,
      required int productID,
      required int buyerID,
      DateTime? orderDate,
      required String deliveryMethod,
      required DateTime deliveryDate,
      PaymentModel? paymentMethod,
      required String totalAmount,
      required String currentStatus,
      int? addressID}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  int? get orderID;
  set orderID(int? value);
  @override
  int get productID;
  set productID(int value);
  @override
  int get buyerID;
  set buyerID(int value);
  @override
  DateTime? get orderDate;
  set orderDate(DateTime? value);
  @override
  String get deliveryMethod;
  set deliveryMethod(String value);
  @override
  DateTime get deliveryDate;
  set deliveryDate(DateTime value);
  @override
  PaymentModel? get paymentMethod;
  set paymentMethod(PaymentModel? value);
  @override
  String get totalAmount;
  set totalAmount(String value);
  @override
  String get currentStatus;
  set currentStatus(String value);
  @override
  int? get addressID;
  set addressID(int? value);
  @override
  @JsonKey(ignore: true)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
