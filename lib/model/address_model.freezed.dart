// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  int? get addressID => throw _privateConstructorUsedError;
  set addressID(int? value) => throw _privateConstructorUsedError;
  String? get unitNumber => throw _privateConstructorUsedError;
  set unitNumber(String? value) => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  set street(String value) => throw _privateConstructorUsedError;
  String get barangay => throw _privateConstructorUsedError;
  set barangay(String value) => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  set city(String value) => throw _privateConstructorUsedError;
  String get province => throw _privateConstructorUsedError;
  set province(String value) => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;
  set zipCode(String value) => throw _privateConstructorUsedError;
  int get userID => throw _privateConstructorUsedError;
  set userID(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res, AddressModel>;
  @useResult
  $Res call(
      {int? addressID,
      String? unitNumber,
      String street,
      String barangay,
      String city,
      String province,
      String zipCode,
      int userID});
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res, $Val extends AddressModel>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressID = freezed,
    Object? unitNumber = freezed,
    Object? street = null,
    Object? barangay = null,
    Object? city = null,
    Object? province = null,
    Object? zipCode = null,
    Object? userID = null,
  }) {
    return _then(_value.copyWith(
      addressID: freezed == addressID
          ? _value.addressID
          : addressID // ignore: cast_nullable_to_non_nullable
              as int?,
      unitNumber: freezed == unitNumber
          ? _value.unitNumber
          : unitNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      barangay: null == barangay
          ? _value.barangay
          : barangay // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressModelImplCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$AddressModelImplCopyWith(
          _$AddressModelImpl value, $Res Function(_$AddressModelImpl) then) =
      __$$AddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? addressID,
      String? unitNumber,
      String street,
      String barangay,
      String city,
      String province,
      String zipCode,
      int userID});
}

/// @nodoc
class __$$AddressModelImplCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res, _$AddressModelImpl>
    implements _$$AddressModelImplCopyWith<$Res> {
  __$$AddressModelImplCopyWithImpl(
      _$AddressModelImpl _value, $Res Function(_$AddressModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressID = freezed,
    Object? unitNumber = freezed,
    Object? street = null,
    Object? barangay = null,
    Object? city = null,
    Object? province = null,
    Object? zipCode = null,
    Object? userID = null,
  }) {
    return _then(_$AddressModelImpl(
      addressID: freezed == addressID
          ? _value.addressID
          : addressID // ignore: cast_nullable_to_non_nullable
              as int?,
      unitNumber: freezed == unitNumber
          ? _value.unitNumber
          : unitNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      barangay: null == barangay
          ? _value.barangay
          : barangay // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressModelImpl implements _AddressModel {
  _$AddressModelImpl(
      {this.addressID,
      this.unitNumber = '',
      required this.street,
      required this.barangay,
      required this.city,
      required this.province,
      required this.zipCode,
      required this.userID});

  factory _$AddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressModelImplFromJson(json);

  @override
  int? addressID;
  @override
  @JsonKey()
  String? unitNumber;
  @override
  String street;
  @override
  String barangay;
  @override
  String city;
  @override
  String province;
  @override
  String zipCode;
  @override
  int userID;

  @override
  String toString() {
    return 'AddressModel(addressID: $addressID, unitNumber: $unitNumber, street: $street, barangay: $barangay, city: $city, province: $province, zipCode: $zipCode, userID: $userID)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      __$$AddressModelImplCopyWithImpl<_$AddressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressModelImplToJson(
      this,
    );
  }
}

abstract class _AddressModel implements AddressModel {
  factory _AddressModel(
      {int? addressID,
      String? unitNumber,
      required String street,
      required String barangay,
      required String city,
      required String province,
      required String zipCode,
      required int userID}) = _$AddressModelImpl;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$AddressModelImpl.fromJson;

  @override
  int? get addressID;
  set addressID(int? value);
  @override
  String? get unitNumber;
  set unitNumber(String? value);
  @override
  String get street;
  set street(String value);
  @override
  String get barangay;
  set barangay(String value);
  @override
  String get city;
  set city(String value);
  @override
  String get province;
  set province(String value);
  @override
  String get zipCode;
  set zipCode(String value);
  @override
  int get userID;
  set userID(int value);
  @override
  @JsonKey(ignore: true)
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
