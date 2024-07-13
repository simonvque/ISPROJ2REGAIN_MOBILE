// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  int? get productID => throw _privateConstructorUsedError;
  set productID(int? value) => throw _privateConstructorUsedError;
  int? get sellerID => throw _privateConstructorUsedError;
  set sellerID(int? value) => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  set productName(String value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;
  String get weight => throw _privateConstructorUsedError;
  set weight(String value) => throw _privateConstructorUsedError;
  int? get location => throw _privateConstructorUsedError;
  set location(int? value) => throw _privateConstructorUsedError;
  int? get categoryID => throw _privateConstructorUsedError;
  set categoryID(int? value) => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  set price(String value) => throw _privateConstructorUsedError;
  bool get canDeliver => throw _privateConstructorUsedError;
  set canDeliver(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {int? productID,
      int? sellerID,
      String productName,
      String? description,
      String weight,
      int? location,
      int? categoryID,
      String price,
      bool canDeliver});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = freezed,
    Object? sellerID = freezed,
    Object? productName = null,
    Object? description = freezed,
    Object? weight = null,
    Object? location = freezed,
    Object? categoryID = freezed,
    Object? price = null,
    Object? canDeliver = null,
  }) {
    return _then(_value.copyWith(
      productID: freezed == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as int?,
      sellerID: freezed == sellerID
          ? _value.sellerID
          : sellerID // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryID: freezed == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as int?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      canDeliver: null == canDeliver
          ? _value.canDeliver
          : canDeliver // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? productID,
      int? sellerID,
      String productName,
      String? description,
      String weight,
      int? location,
      int? categoryID,
      String price,
      bool canDeliver});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = freezed,
    Object? sellerID = freezed,
    Object? productName = null,
    Object? description = freezed,
    Object? weight = null,
    Object? location = freezed,
    Object? categoryID = freezed,
    Object? price = null,
    Object? canDeliver = null,
  }) {
    return _then(_$ProductImpl(
      productID: freezed == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as int?,
      sellerID: freezed == sellerID
          ? _value.sellerID
          : sellerID // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryID: freezed == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as int?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      canDeliver: null == canDeliver
          ? _value.canDeliver
          : canDeliver // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  _$ProductImpl(
      {this.productID,
      required this.sellerID,
      required this.productName,
      this.description = '',
      required this.weight,
      required this.location,
      required this.categoryID,
      required this.price,
      required this.canDeliver});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  int? productID;
  @override
  int? sellerID;
  @override
  String productName;
  @override
  @JsonKey()
  String? description;
  @override
  String weight;
  @override
  int? location;
  @override
  int? categoryID;
  @override
  String price;
  @override
  bool canDeliver;

  @override
  String toString() {
    return 'Product(productID: $productID, sellerID: $sellerID, productName: $productName, description: $description, weight: $weight, location: $location, categoryID: $categoryID, price: $price, canDeliver: $canDeliver)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  factory _Product(
      {int? productID,
      required int? sellerID,
      required String productName,
      String? description,
      required String weight,
      required int? location,
      required int? categoryID,
      required String price,
      required bool canDeliver}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  int? get productID;
  set productID(int? value);
  @override
  int? get sellerID;
  set sellerID(int? value);
  @override
  String get productName;
  set productName(String value);
  @override
  String? get description;
  set description(String? value);
  @override
  String get weight;
  set weight(String value);
  @override
  int? get location;
  set location(int? value);
  @override
  int? get categoryID;
  set categoryID(int? value);
  @override
  String get price;
  set price(String value);
  @override
  bool get canDeliver;
  set canDeliver(bool value);
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
