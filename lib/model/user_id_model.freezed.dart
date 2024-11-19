// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_id_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserIDModel _$UserIDModelFromJson(Map<String, dynamic> json) {
  return __UserIDModel.fromJson(json);
}

/// @nodoc
mixin _$UserIDModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;
  set user(UserModel value) => throw _privateConstructorUsedError;
  String? get idType => throw _privateConstructorUsedError;
  set idType(String? value) => throw _privateConstructorUsedError;
  String? get idNumber => throw _privateConstructorUsedError;
  set idNumber(String? value) => throw _privateConstructorUsedError;
  String? get idImage => throw _privateConstructorUsedError;
  set idImage(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserIDModelCopyWith<UserIDModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserIDModelCopyWith<$Res> {
  factory $UserIDModelCopyWith(
          UserIDModel value, $Res Function(UserIDModel) then) =
      _$UserIDModelCopyWithImpl<$Res, UserIDModel>;
  @useResult
  $Res call(
      {int? id,
      UserModel user,
      String? idType,
      String? idNumber,
      String? idImage});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$UserIDModelCopyWithImpl<$Res, $Val extends UserIDModel>
    implements $UserIDModelCopyWith<$Res> {
  _$UserIDModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = null,
    Object? idType = freezed,
    Object? idNumber = freezed,
    Object? idImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      idType: freezed == idType
          ? _value.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: freezed == idNumber
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      idImage: freezed == idImage
          ? _value.idImage
          : idImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserIDModelImplCopyWith<$Res>
    implements $UserIDModelCopyWith<$Res> {
  factory _$$_UserIDModelImplCopyWith(
          _$_UserIDModelImpl value, $Res Function(_$_UserIDModelImpl) then) =
      __$$_UserIDModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      UserModel user,
      String? idType,
      String? idNumber,
      String? idImage});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$_UserIDModelImplCopyWithImpl<$Res>
    extends _$UserIDModelCopyWithImpl<$Res, _$_UserIDModelImpl>
    implements _$$_UserIDModelImplCopyWith<$Res> {
  __$$_UserIDModelImplCopyWithImpl(
      _$_UserIDModelImpl _value, $Res Function(_$_UserIDModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = null,
    Object? idType = freezed,
    Object? idNumber = freezed,
    Object? idImage = freezed,
  }) {
    return _then(_$_UserIDModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      idType: freezed == idType
          ? _value.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: freezed == idNumber
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      idImage: freezed == idImage
          ? _value.idImage
          : idImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserIDModelImpl with DiagnosticableTreeMixin implements __UserIDModel {
  _$_UserIDModelImpl(
      {this.id, required this.user, this.idType, this.idNumber, this.idImage});

  factory _$_UserIDModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$_UserIDModelImplFromJson(json);

  @override
  int? id;
  @override
  UserModel user;
  @override
  String? idType;
  @override
  String? idNumber;
  @override
  String? idImage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserIDModel(id: $id, user: $user, idType: $idType, idNumber: $idNumber, idImage: $idImage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserIDModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('idType', idType))
      ..add(DiagnosticsProperty('idNumber', idNumber))
      ..add(DiagnosticsProperty('idImage', idImage));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserIDModelImplCopyWith<_$_UserIDModelImpl> get copyWith =>
      __$$_UserIDModelImplCopyWithImpl<_$_UserIDModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserIDModelImplToJson(
      this,
    );
  }
}

abstract class __UserIDModel implements UserIDModel {
  factory __UserIDModel(
      {int? id,
      required UserModel user,
      String? idType,
      String? idNumber,
      String? idImage}) = _$_UserIDModelImpl;

  factory __UserIDModel.fromJson(Map<String, dynamic> json) =
      _$_UserIDModelImpl.fromJson;

  @override
  int? get id;
  set id(int? value);
  @override
  UserModel get user;
  set user(UserModel value);
  @override
  String? get idType;
  set idType(String? value);
  @override
  String? get idNumber;
  set idNumber(String? value);
  @override
  String? get idImage;
  set idImage(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_UserIDModelImplCopyWith<_$_UserIDModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
