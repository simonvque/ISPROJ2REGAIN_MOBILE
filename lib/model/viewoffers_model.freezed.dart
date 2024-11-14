// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'viewoffers_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViewOffersModel _$ViewOffersModelFromJson(Map<String, dynamic> json) {
  return _ViewOffersModel.fromJson(json);
}

/// @nodoc
mixin _$ViewOffersModel {
  int? get offerID => throw _privateConstructorUsedError;
  set offerID(int? value) => throw _privateConstructorUsedError;
  String get buyerName => throw _privateConstructorUsedError;
  set buyerName(String value) => throw _privateConstructorUsedError;
  ViewProduct get product => throw _privateConstructorUsedError;
  set product(ViewProduct value) => throw _privateConstructorUsedError;
  String get offerValue => throw _privateConstructorUsedError;
  set offerValue(String value) => throw _privateConstructorUsedError;
  bool? get isAccepted => throw _privateConstructorUsedError;
  set isAccepted(bool? value) => throw _privateConstructorUsedError;
  String get sellerName => throw _privateConstructorUsedError;
  set sellerName(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewOffersModelCopyWith<ViewOffersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewOffersModelCopyWith<$Res> {
  factory $ViewOffersModelCopyWith(
          ViewOffersModel value, $Res Function(ViewOffersModel) then) =
      _$ViewOffersModelCopyWithImpl<$Res, ViewOffersModel>;
  @useResult
  $Res call(
      {int? offerID,
      String buyerName,
      ViewProduct product,
      String offerValue,
      bool? isAccepted,
      String sellerName});

  $ViewProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ViewOffersModelCopyWithImpl<$Res, $Val extends ViewOffersModel>
    implements $ViewOffersModelCopyWith<$Res> {
  _$ViewOffersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerID = freezed,
    Object? buyerName = null,
    Object? product = null,
    Object? offerValue = null,
    Object? isAccepted = freezed,
    Object? sellerName = null,
  }) {
    return _then(_value.copyWith(
      offerID: freezed == offerID
          ? _value.offerID
          : offerID // ignore: cast_nullable_to_non_nullable
              as int?,
      buyerName: null == buyerName
          ? _value.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ViewProduct,
      offerValue: null == offerValue
          ? _value.offerValue
          : offerValue // ignore: cast_nullable_to_non_nullable
              as String,
      isAccepted: freezed == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewProductCopyWith<$Res> get product {
    return $ViewProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViewOffersModelImplCopyWith<$Res>
    implements $ViewOffersModelCopyWith<$Res> {
  factory _$$ViewOffersModelImplCopyWith(_$ViewOffersModelImpl value,
          $Res Function(_$ViewOffersModelImpl) then) =
      __$$ViewOffersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? offerID,
      String buyerName,
      ViewProduct product,
      String offerValue,
      bool? isAccepted,
      String sellerName});

  @override
  $ViewProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ViewOffersModelImplCopyWithImpl<$Res>
    extends _$ViewOffersModelCopyWithImpl<$Res, _$ViewOffersModelImpl>
    implements _$$ViewOffersModelImplCopyWith<$Res> {
  __$$ViewOffersModelImplCopyWithImpl(
      _$ViewOffersModelImpl _value, $Res Function(_$ViewOffersModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerID = freezed,
    Object? buyerName = null,
    Object? product = null,
    Object? offerValue = null,
    Object? isAccepted = freezed,
    Object? sellerName = null,
  }) {
    return _then(_$ViewOffersModelImpl(
      offerID: freezed == offerID
          ? _value.offerID
          : offerID // ignore: cast_nullable_to_non_nullable
              as int?,
      buyerName: null == buyerName
          ? _value.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ViewProduct,
      offerValue: null == offerValue
          ? _value.offerValue
          : offerValue // ignore: cast_nullable_to_non_nullable
              as String,
      isAccepted: freezed == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViewOffersModelImpl implements _ViewOffersModel {
  _$ViewOffersModelImpl(
      {this.offerID,
      required this.buyerName,
      required this.product,
      required this.offerValue,
      this.isAccepted,
      required this.sellerName});

  factory _$ViewOffersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewOffersModelImplFromJson(json);

  @override
  int? offerID;
  @override
  String buyerName;
  @override
  ViewProduct product;
  @override
  String offerValue;
  @override
  bool? isAccepted;
  @override
  String sellerName;

  @override
  String toString() {
    return 'ViewOffersModel(offerID: $offerID, buyerName: $buyerName, product: $product, offerValue: $offerValue, isAccepted: $isAccepted, sellerName: $sellerName)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewOffersModelImplCopyWith<_$ViewOffersModelImpl> get copyWith =>
      __$$ViewOffersModelImplCopyWithImpl<_$ViewOffersModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViewOffersModelImplToJson(
      this,
    );
  }
}

abstract class _ViewOffersModel implements ViewOffersModel {
  factory _ViewOffersModel(
      {int? offerID,
      required String buyerName,
      required ViewProduct product,
      required String offerValue,
      bool? isAccepted,
      required String sellerName}) = _$ViewOffersModelImpl;

  factory _ViewOffersModel.fromJson(Map<String, dynamic> json) =
      _$ViewOffersModelImpl.fromJson;

  @override
  int? get offerID;
  set offerID(int? value);
  @override
  String get buyerName;
  set buyerName(String value);
  @override
  ViewProduct get product;
  set product(ViewProduct value);
  @override
  String get offerValue;
  set offerValue(String value);
  @override
  bool? get isAccepted;
  set isAccepted(bool? value);
  @override
  String get sellerName;
  set sellerName(String value);
  @override
  @JsonKey(ignore: true)
  _$$ViewOffersModelImplCopyWith<_$ViewOffersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
