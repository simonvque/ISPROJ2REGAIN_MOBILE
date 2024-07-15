// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) {
  return _FavoriteModel.fromJson(json);
}

/// @nodoc
mixin _$FavoriteModel {
  int? get favoriteID => throw _privateConstructorUsedError;
  set favoriteID(int? value) => throw _privateConstructorUsedError;
  int get userID => throw _privateConstructorUsedError;
  set userID(int value) => throw _privateConstructorUsedError;
  int get productID => throw _privateConstructorUsedError;
  set productID(int value) => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  set isFavorite(bool value) => throw _privateConstructorUsedError;
  int? get sellerID => throw _privateConstructorUsedError;
  set sellerID(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteModelCopyWith<FavoriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteModelCopyWith<$Res> {
  factory $FavoriteModelCopyWith(
          FavoriteModel value, $Res Function(FavoriteModel) then) =
      _$FavoriteModelCopyWithImpl<$Res, FavoriteModel>;
  @useResult
  $Res call(
      {int? favoriteID,
      int userID,
      int productID,
      bool isFavorite,
      int? sellerID});
}

/// @nodoc
class _$FavoriteModelCopyWithImpl<$Res, $Val extends FavoriteModel>
    implements $FavoriteModelCopyWith<$Res> {
  _$FavoriteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteID = freezed,
    Object? userID = null,
    Object? productID = null,
    Object? isFavorite = null,
    Object? sellerID = freezed,
  }) {
    return _then(_value.copyWith(
      favoriteID: freezed == favoriteID
          ? _value.favoriteID
          : favoriteID // ignore: cast_nullable_to_non_nullable
              as int?,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      sellerID: freezed == sellerID
          ? _value.sellerID
          : sellerID // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteModelImplCopyWith<$Res>
    implements $FavoriteModelCopyWith<$Res> {
  factory _$$FavoriteModelImplCopyWith(
          _$FavoriteModelImpl value, $Res Function(_$FavoriteModelImpl) then) =
      __$$FavoriteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? favoriteID,
      int userID,
      int productID,
      bool isFavorite,
      int? sellerID});
}

/// @nodoc
class __$$FavoriteModelImplCopyWithImpl<$Res>
    extends _$FavoriteModelCopyWithImpl<$Res, _$FavoriteModelImpl>
    implements _$$FavoriteModelImplCopyWith<$Res> {
  __$$FavoriteModelImplCopyWithImpl(
      _$FavoriteModelImpl _value, $Res Function(_$FavoriteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteID = freezed,
    Object? userID = null,
    Object? productID = null,
    Object? isFavorite = null,
    Object? sellerID = freezed,
  }) {
    return _then(_$FavoriteModelImpl(
      favoriteID: freezed == favoriteID
          ? _value.favoriteID
          : favoriteID // ignore: cast_nullable_to_non_nullable
              as int?,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
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
class _$FavoriteModelImpl implements _FavoriteModel {
  _$FavoriteModelImpl(
      {this.favoriteID,
      required this.userID,
      required this.productID,
      this.isFavorite = true,
      this.sellerID});

  factory _$FavoriteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteModelImplFromJson(json);

  @override
  int? favoriteID;
  @override
  int userID;
  @override
  int productID;
  @override
  @JsonKey()
  bool isFavorite;
  @override
  int? sellerID;

  @override
  String toString() {
    return 'FavoriteModel(favoriteID: $favoriteID, userID: $userID, productID: $productID, isFavorite: $isFavorite, sellerID: $sellerID)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteModelImplCopyWith<_$FavoriteModelImpl> get copyWith =>
      __$$FavoriteModelImplCopyWithImpl<_$FavoriteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteModelImplToJson(
      this,
    );
  }
}

abstract class _FavoriteModel implements FavoriteModel {
  factory _FavoriteModel(
      {int? favoriteID,
      required int userID,
      required int productID,
      bool isFavorite,
      int? sellerID}) = _$FavoriteModelImpl;

  factory _FavoriteModel.fromJson(Map<String, dynamic> json) =
      _$FavoriteModelImpl.fromJson;

  @override
  int? get favoriteID;
  set favoriteID(int? value);
  @override
  int get userID;
  set userID(int value);
  @override
  int get productID;
  set productID(int value);
  @override
  bool get isFavorite;
  set isFavorite(bool value);
  @override
  int? get sellerID;
  set sellerID(int? value);
  @override
  @JsonKey(ignore: true)
  _$$FavoriteModelImplCopyWith<_$FavoriteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
