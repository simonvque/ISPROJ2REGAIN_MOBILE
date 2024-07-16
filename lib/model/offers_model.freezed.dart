// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offers_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OffersModel _$OffersModelFromJson(Map<String, dynamic> json) {
  return _OffersModel.fromJson(json);
}

/// @nodoc
mixin _$OffersModel {
  int? get offerID => throw _privateConstructorUsedError;
  set offerID(int? value) => throw _privateConstructorUsedError;
  int? get productID => throw _privateConstructorUsedError;
  set productID(int? value) => throw _privateConstructorUsedError;
  int? get buyerID => throw _privateConstructorUsedError;
  set buyerID(int? value) => throw _privateConstructorUsedError;
  String get offerValue => throw _privateConstructorUsedError;
  set offerValue(String value) => throw _privateConstructorUsedError;
  bool get isAccepted => throw _privateConstructorUsedError;
  set isAccepted(bool value) => throw _privateConstructorUsedError;
  int? get sellerID => throw _privateConstructorUsedError;
  set sellerID(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OffersModelCopyWith<OffersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OffersModelCopyWith<$Res> {
  factory $OffersModelCopyWith(
          OffersModel value, $Res Function(OffersModel) then) =
      _$OffersModelCopyWithImpl<$Res, OffersModel>;
  @useResult
  $Res call(
      {int? offerID,
      int? productID,
      int? buyerID,
      String offerValue,
      bool isAccepted,
      int? sellerID});
}

/// @nodoc
class _$OffersModelCopyWithImpl<$Res, $Val extends OffersModel>
    implements $OffersModelCopyWith<$Res> {
  _$OffersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerID = freezed,
    Object? productID = freezed,
    Object? buyerID = freezed,
    Object? offerValue = null,
    Object? isAccepted = null,
    Object? sellerID = freezed,
  }) {
    return _then(_value.copyWith(
      offerID: freezed == offerID
          ? _value.offerID
          : offerID // ignore: cast_nullable_to_non_nullable
              as int?,
      productID: freezed == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as int?,
      buyerID: freezed == buyerID
          ? _value.buyerID
          : buyerID // ignore: cast_nullable_to_non_nullable
              as int?,
      offerValue: null == offerValue
          ? _value.offerValue
          : offerValue // ignore: cast_nullable_to_non_nullable
              as String,
      isAccepted: null == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      sellerID: freezed == sellerID
          ? _value.sellerID
          : sellerID // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OffersModelImplCopyWith<$Res>
    implements $OffersModelCopyWith<$Res> {
  factory _$$OffersModelImplCopyWith(
          _$OffersModelImpl value, $Res Function(_$OffersModelImpl) then) =
      __$$OffersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? offerID,
      int? productID,
      int? buyerID,
      String offerValue,
      bool isAccepted,
      int? sellerID});
}

/// @nodoc
class __$$OffersModelImplCopyWithImpl<$Res>
    extends _$OffersModelCopyWithImpl<$Res, _$OffersModelImpl>
    implements _$$OffersModelImplCopyWith<$Res> {
  __$$OffersModelImplCopyWithImpl(
      _$OffersModelImpl _value, $Res Function(_$OffersModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerID = freezed,
    Object? productID = freezed,
    Object? buyerID = freezed,
    Object? offerValue = null,
    Object? isAccepted = null,
    Object? sellerID = freezed,
  }) {
    return _then(_$OffersModelImpl(
      offerID: freezed == offerID
          ? _value.offerID
          : offerID // ignore: cast_nullable_to_non_nullable
              as int?,
      productID: freezed == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as int?,
      buyerID: freezed == buyerID
          ? _value.buyerID
          : buyerID // ignore: cast_nullable_to_non_nullable
              as int?,
      offerValue: null == offerValue
          ? _value.offerValue
          : offerValue // ignore: cast_nullable_to_non_nullable
              as String,
      isAccepted: null == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      sellerID: freezed == sellerID
          ? _value.sellerID
          : sellerID // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OffersModelImpl implements _OffersModel {
  _$OffersModelImpl(
      {this.offerID,
      this.productID,
      this.buyerID,
      required this.offerValue,
      required this.isAccepted,
      this.sellerID});

  factory _$OffersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OffersModelImplFromJson(json);

  @override
  int? offerID;
  @override
  int? productID;
  @override
  int? buyerID;
  @override
  String offerValue;
  @override
  bool isAccepted;
  @override
  int? sellerID;

  @override
  String toString() {
    return 'OffersModel(offerID: $offerID, productID: $productID, buyerID: $buyerID, offerValue: $offerValue, isAccepted: $isAccepted, sellerID: $sellerID)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OffersModelImplCopyWith<_$OffersModelImpl> get copyWith =>
      __$$OffersModelImplCopyWithImpl<_$OffersModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OffersModelImplToJson(
      this,
    );
  }
}

abstract class _OffersModel implements OffersModel {
  factory _OffersModel(
      {int? offerID,
      int? productID,
      int? buyerID,
      required String offerValue,
      required bool isAccepted,
      int? sellerID}) = _$OffersModelImpl;

  factory _OffersModel.fromJson(Map<String, dynamic> json) =
      _$OffersModelImpl.fromJson;

  @override
  int? get offerID;
  set offerID(int? value);
  @override
  int? get productID;
  set productID(int? value);
  @override
  int? get buyerID;
  set buyerID(int? value);
  @override
  String get offerValue;
  set offerValue(String value);
  @override
  bool get isAccepted;
  set isAccepted(bool value);
  @override
  int? get sellerID;
  set sellerID(int? value);
  @override
  @JsonKey(ignore: true)
  _$$OffersModelImplCopyWith<_$OffersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
