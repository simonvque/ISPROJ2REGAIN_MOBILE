// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_update_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfileUpdateModel _$UserProfileUpdateModelFromJson(
    Map<String, dynamic> json) {
  return _UserProfileUpdateModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileUpdateModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  set firstName(String? value) => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  set lastName(String? value) => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  set username(String value) => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get profileImage => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  set profileImage(Uint8List? value) => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get gcashQRcode => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  set gcashQRcode(Uint8List? value) => throw _privateConstructorUsedError;
  String? get junkshopName => throw _privateConstructorUsedError;
  set junkshopName(String? value) => throw _privateConstructorUsedError;

  /// Serializes this UserProfileUpdateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileUpdateModelCopyWith<UserProfileUpdateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileUpdateModelCopyWith<$Res> {
  factory $UserProfileUpdateModelCopyWith(UserProfileUpdateModel value,
          $Res Function(UserProfileUpdateModel) then) =
      _$UserProfileUpdateModelCopyWithImpl<$Res, UserProfileUpdateModel>;
  @useResult
  $Res call(
      {int? id,
      String? firstName,
      String? lastName,
      String username,
      @Uint8ListConverter() Uint8List? profileImage,
      @Uint8ListConverter() Uint8List? gcashQRcode,
      String? junkshopName});
}

/// @nodoc
class _$UserProfileUpdateModelCopyWithImpl<$Res,
        $Val extends UserProfileUpdateModel>
    implements $UserProfileUpdateModelCopyWith<$Res> {
  _$UserProfileUpdateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? username = null,
    Object? profileImage = freezed,
    Object? gcashQRcode = freezed,
    Object? junkshopName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      gcashQRcode: freezed == gcashQRcode
          ? _value.gcashQRcode
          : gcashQRcode // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      junkshopName: freezed == junkshopName
          ? _value.junkshopName
          : junkshopName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileUpdateModelImplCopyWith<$Res>
    implements $UserProfileUpdateModelCopyWith<$Res> {
  factory _$$UserProfileUpdateModelImplCopyWith(
          _$UserProfileUpdateModelImpl value,
          $Res Function(_$UserProfileUpdateModelImpl) then) =
      __$$UserProfileUpdateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? firstName,
      String? lastName,
      String username,
      @Uint8ListConverter() Uint8List? profileImage,
      @Uint8ListConverter() Uint8List? gcashQRcode,
      String? junkshopName});
}

/// @nodoc
class __$$UserProfileUpdateModelImplCopyWithImpl<$Res>
    extends _$UserProfileUpdateModelCopyWithImpl<$Res,
        _$UserProfileUpdateModelImpl>
    implements _$$UserProfileUpdateModelImplCopyWith<$Res> {
  __$$UserProfileUpdateModelImplCopyWithImpl(
      _$UserProfileUpdateModelImpl _value,
      $Res Function(_$UserProfileUpdateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? username = null,
    Object? profileImage = freezed,
    Object? gcashQRcode = freezed,
    Object? junkshopName = freezed,
  }) {
    return _then(_$UserProfileUpdateModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      gcashQRcode: freezed == gcashQRcode
          ? _value.gcashQRcode
          : gcashQRcode // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      junkshopName: freezed == junkshopName
          ? _value.junkshopName
          : junkshopName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileUpdateModelImpl implements _UserProfileUpdateModel {
  _$UserProfileUpdateModelImpl(
      {this.id,
      this.firstName = '',
      this.lastName = '',
      required this.username,
      @Uint8ListConverter() this.profileImage,
      @Uint8ListConverter() this.gcashQRcode,
      this.junkshopName = ''});

  factory _$UserProfileUpdateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileUpdateModelImplFromJson(json);

  @override
  int? id;
  @override
  @JsonKey()
  String? firstName;
  @override
  @JsonKey()
  String? lastName;
  @override
  String username;
  @override
  @Uint8ListConverter()
  Uint8List? profileImage;
  @override
  @Uint8ListConverter()
  Uint8List? gcashQRcode;
  @override
  @JsonKey()
  String? junkshopName;

  @override
  String toString() {
    return 'UserProfileUpdateModel(id: $id, firstName: $firstName, lastName: $lastName, username: $username, profileImage: $profileImage, gcashQRcode: $gcashQRcode, junkshopName: $junkshopName)';
  }

  /// Create a copy of UserProfileUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileUpdateModelImplCopyWith<_$UserProfileUpdateModelImpl>
      get copyWith => __$$UserProfileUpdateModelImplCopyWithImpl<
          _$UserProfileUpdateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileUpdateModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfileUpdateModel implements UserProfileUpdateModel {
  factory _UserProfileUpdateModel(
      {int? id,
      String? firstName,
      String? lastName,
      required String username,
      @Uint8ListConverter() Uint8List? profileImage,
      @Uint8ListConverter() Uint8List? gcashQRcode,
      String? junkshopName}) = _$UserProfileUpdateModelImpl;

  factory _UserProfileUpdateModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileUpdateModelImpl.fromJson;

  @override
  int? get id;
  set id(int? value);
  @override
  String? get firstName;
  set firstName(String? value);
  @override
  String? get lastName;
  set lastName(String? value);
  @override
  String get username;
  set username(String value);
  @override
  @Uint8ListConverter()
  Uint8List? get profileImage;
  @Uint8ListConverter()
  set profileImage(Uint8List? value);
  @override
  @Uint8ListConverter()
  Uint8List? get gcashQRcode;
  @Uint8ListConverter()
  set gcashQRcode(Uint8List? value);
  @override
  String? get junkshopName;
  set junkshopName(String? value);

  /// Create a copy of UserProfileUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileUpdateModelImplCopyWith<_$UserProfileUpdateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
