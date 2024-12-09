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
  ViewProduct get product => throw _privateConstructorUsedError;
  set product(ViewProduct value) => throw _privateConstructorUsedError;
  String get buyerUsername => throw _privateConstructorUsedError;
  set buyerUsername(String value) => throw _privateConstructorUsedError;
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
  String? get commissionFee => throw _privateConstructorUsedError;
  set commissionFee(String? value) => throw _privateConstructorUsedError;
  String get currentStatus => throw _privateConstructorUsedError;
  set currentStatus(String value) => throw _privateConstructorUsedError;
  AddressModel? get address => throw _privateConstructorUsedError;
  set address(AddressModel? value) => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      ViewProduct product,
      String buyerUsername,
      DateTime? orderDate,
      String deliveryMethod,
      DateTime deliveryDate,
      PaymentModel? paymentMethod,
      String totalAmount,
      String? commissionFee,
      String currentStatus,
      AddressModel? address});

  $ViewProductCopyWith<$Res> get product;
  $PaymentModelCopyWith<$Res>? get paymentMethod;
  $AddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderID = freezed,
    Object? product = null,
    Object? buyerUsername = null,
    Object? orderDate = freezed,
    Object? deliveryMethod = null,
    Object? deliveryDate = null,
    Object? paymentMethod = freezed,
    Object? totalAmount = null,
    Object? commissionFee = freezed,
    Object? currentStatus = null,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      orderID: freezed == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int?,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ViewProduct,
      buyerUsername: null == buyerUsername
          ? _value.buyerUsername
          : buyerUsername // ignore: cast_nullable_to_non_nullable
              as String,
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
      commissionFee: freezed == commissionFee
          ? _value.commissionFee
          : commissionFee // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStatus: null == currentStatus
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
    ) as $Val);
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ViewProductCopyWith<$Res> get product {
    return $ViewProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
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
      ViewProduct product,
      String buyerUsername,
      DateTime? orderDate,
      String deliveryMethod,
      DateTime deliveryDate,
      PaymentModel? paymentMethod,
      String totalAmount,
      String? commissionFee,
      String currentStatus,
      AddressModel? address});

  @override
  $ViewProductCopyWith<$Res> get product;
  @override
  $PaymentModelCopyWith<$Res>? get paymentMethod;
  @override
  $AddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderID = freezed,
    Object? product = null,
    Object? buyerUsername = null,
    Object? orderDate = freezed,
    Object? deliveryMethod = null,
    Object? deliveryDate = null,
    Object? paymentMethod = freezed,
    Object? totalAmount = null,
    Object? commissionFee = freezed,
    Object? currentStatus = null,
    Object? address = freezed,
  }) {
    return _then(_$OrderModelImpl(
      orderID: freezed == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int?,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ViewProduct,
      buyerUsername: null == buyerUsername
          ? _value.buyerUsername
          : buyerUsername // ignore: cast_nullable_to_non_nullable
              as String,
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
      commissionFee: freezed == commissionFee
          ? _value.commissionFee
          : commissionFee // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStatus: null == currentStatus
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  _$OrderModelImpl(
      {this.orderID,
      required this.product,
      required this.buyerUsername,
      this.orderDate,
      required this.deliveryMethod,
      required this.deliveryDate,
      this.paymentMethod,
      required this.totalAmount,
      this.commissionFee,
      required this.currentStatus,
      this.address});

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  int? orderID;
  @override
  ViewProduct product;
  @override
  String buyerUsername;
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
  String? commissionFee;
  @override
  String currentStatus;
  @override
  AddressModel? address;

  @override
  String toString() {
    return 'OrderModel(orderID: $orderID, product: $product, buyerUsername: $buyerUsername, orderDate: $orderDate, deliveryMethod: $deliveryMethod, deliveryDate: $deliveryDate, paymentMethod: $paymentMethod, totalAmount: $totalAmount, commissionFee: $commissionFee, currentStatus: $currentStatus, address: $address)';
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      required ViewProduct product,
      required String buyerUsername,
      DateTime? orderDate,
      required String deliveryMethod,
      required DateTime deliveryDate,
      PaymentModel? paymentMethod,
      required String totalAmount,
      String? commissionFee,
      required String currentStatus,
      AddressModel? address}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  int? get orderID;
  set orderID(int? value);
  @override
  ViewProduct get product;
  set product(ViewProduct value);
  @override
  String get buyerUsername;
  set buyerUsername(String value);
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
  String? get commissionFee;
  set commissionFee(String? value);
  @override
  String get currentStatus;
  set currentStatus(String value);
  @override
  AddressModel? get address;
  set address(AddressModel? value);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
