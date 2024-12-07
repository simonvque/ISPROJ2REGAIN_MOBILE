// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  set role(String value) => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  set firstName(String? value) => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  set lastName(String? value) => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  set username(String value) => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  set password(String value) => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  set email(String? value) => throw _privateConstructorUsedError;
  String get accountStatus => throw _privateConstructorUsedError;
  set accountStatus(String value) => throw _privateConstructorUsedError;
  int? get penaltyPoints => throw _privateConstructorUsedError;
  set penaltyPoints(int? value) => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  set phone(String? value) => throw _privateConstructorUsedError;
  String? get profileImagePath => throw _privateConstructorUsedError;
  set profileImagePath(String? value) => throw _privateConstructorUsedError;
  String? get gcashQR => throw _privateConstructorUsedError;
  set gcashQR(String? value) => throw _privateConstructorUsedError;
  DateTime? get birthday => throw _privateConstructorUsedError;
  set birthday(DateTime? value) => throw _privateConstructorUsedError;
  String? get junkshopName => throw _privateConstructorUsedError;
  set junkshopName(String? value) => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int? id,
      String role,
      String? firstName,
      String? lastName,
      String username,
      String password,
      String? email,
      String accountStatus,
      int? penaltyPoints,
      String? phone,
      String? profileImagePath,
      String? gcashQR,
      DateTime? birthday,
      String? junkshopName});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? role = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? username = null,
    Object? password = null,
    Object? email = freezed,
    Object? accountStatus = null,
    Object? penaltyPoints = freezed,
    Object? phone = freezed,
    Object? profileImagePath = freezed,
    Object? gcashQR = freezed,
    Object? birthday = freezed,
    Object? junkshopName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
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
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      accountStatus: null == accountStatus
          ? _value.accountStatus
          : accountStatus // ignore: cast_nullable_to_non_nullable
              as String,
      penaltyPoints: freezed == penaltyPoints
          ? _value.penaltyPoints
          : penaltyPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImagePath: freezed == profileImagePath
          ? _value.profileImagePath
          : profileImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      gcashQR: freezed == gcashQR
          ? _value.gcashQR
          : gcashQR // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      junkshopName: freezed == junkshopName
          ? _value.junkshopName
          : junkshopName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String role,
      String? firstName,
      String? lastName,
      String username,
      String password,
      String? email,
      String accountStatus,
      int? penaltyPoints,
      String? phone,
      String? profileImagePath,
      String? gcashQR,
      DateTime? birthday,
      String? junkshopName});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? role = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? username = null,
    Object? password = null,
    Object? email = freezed,
    Object? accountStatus = null,
    Object? penaltyPoints = freezed,
    Object? phone = freezed,
    Object? profileImagePath = freezed,
    Object? gcashQR = freezed,
    Object? birthday = freezed,
    Object? junkshopName = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
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
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      accountStatus: null == accountStatus
          ? _value.accountStatus
          : accountStatus // ignore: cast_nullable_to_non_nullable
              as String,
      penaltyPoints: freezed == penaltyPoints
          ? _value.penaltyPoints
          : penaltyPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImagePath: freezed == profileImagePath
          ? _value.profileImagePath
          : profileImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      gcashQR: freezed == gcashQR
          ? _value.gcashQR
          : gcashQR // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      junkshopName: freezed == junkshopName
          ? _value.junkshopName
          : junkshopName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {this.id,
      this.role = '',
      this.firstName = '',
      this.lastName = '',
      required this.username,
      required this.password,
      this.email = '',
      this.accountStatus = 'Pending',
      this.penaltyPoints = 0,
      this.phone,
      this.profileImagePath = '',
      this.gcashQR = '',
      this.birthday,
      this.junkshopName = ''});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  int? id;
  @override
  @JsonKey()
  String role;
  @override
  @JsonKey()
  String? firstName;
  @override
  @JsonKey()
  String? lastName;
  @override
  String username;
  @override
  String password;
  @override
  @JsonKey()
  String? email;
  @override
  @JsonKey()
  String accountStatus;
  @override
  @JsonKey()
  int? penaltyPoints;
  @override
  String? phone;
  @override
  @JsonKey()
  String? profileImagePath;
  @override
  @JsonKey()
  String? gcashQR;
  @override
  DateTime? birthday;
  @override
  @JsonKey()
  String? junkshopName;

  @override
  String toString() {
    return 'UserModel(id: $id, role: $role, firstName: $firstName, lastName: $lastName, username: $username, password: $password, email: $email, accountStatus: $accountStatus, penaltyPoints: $penaltyPoints, phone: $phone, profileImagePath: $profileImagePath, gcashQR: $gcashQR, birthday: $birthday, junkshopName: $junkshopName)';
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {int? id,
      String role,
      String? firstName,
      String? lastName,
      required String username,
      required String password,
      String? email,
      String accountStatus,
      int? penaltyPoints,
      String? phone,
      String? profileImagePath,
      String? gcashQR,
      DateTime? birthday,
      String? junkshopName}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int? get id;
  set id(int? value);
  @override
  String get role;
  set role(String value);
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
  String get password;
  set password(String value);
  @override
  String? get email;
  set email(String? value);
  @override
  String get accountStatus;
  set accountStatus(String value);
  @override
  int? get penaltyPoints;
  set penaltyPoints(int? value);
  @override
  String? get phone;
  set phone(String? value);
  @override
  String? get profileImagePath;
  set profileImagePath(String? value);
  @override
  String? get gcashQR;
  set gcashQR(String? value);
  @override
  DateTime? get birthday;
  set birthday(DateTime? value);
  @override
  String? get junkshopName;
  set junkshopName(String? value);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
