// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'green_zone_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GreenZoneModel _$GreenZoneModelFromJson(Map<String, dynamic> json) {
  return _GreenZoneModel.fromJson(json);
}

/// @nodoc
mixin _$GreenZoneModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GreenZoneModelCopyWith<GreenZoneModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GreenZoneModelCopyWith<$Res> {
  factory $GreenZoneModelCopyWith(
          GreenZoneModel value, $Res Function(GreenZoneModel) then) =
      _$GreenZoneModelCopyWithImpl<$Res, GreenZoneModel>;
  @useResult
  $Res call({int id, String title, String link, String summary, DateTime date});
}

/// @nodoc
class _$GreenZoneModelCopyWithImpl<$Res, $Val extends GreenZoneModel>
    implements $GreenZoneModelCopyWith<$Res> {
  _$GreenZoneModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? link = null,
    Object? summary = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GreenZoneModelImplCopyWith<$Res>
    implements $GreenZoneModelCopyWith<$Res> {
  factory _$$GreenZoneModelImplCopyWith(_$GreenZoneModelImpl value,
          $Res Function(_$GreenZoneModelImpl) then) =
      __$$GreenZoneModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String link, String summary, DateTime date});
}

/// @nodoc
class __$$GreenZoneModelImplCopyWithImpl<$Res>
    extends _$GreenZoneModelCopyWithImpl<$Res, _$GreenZoneModelImpl>
    implements _$$GreenZoneModelImplCopyWith<$Res> {
  __$$GreenZoneModelImplCopyWithImpl(
      _$GreenZoneModelImpl _value, $Res Function(_$GreenZoneModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? link = null,
    Object? summary = null,
    Object? date = null,
  }) {
    return _then(_$GreenZoneModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GreenZoneModelImpl implements _GreenZoneModel {
  const _$GreenZoneModelImpl(
      {required this.id,
      required this.title,
      required this.link,
      required this.summary,
      required this.date});

  factory _$GreenZoneModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GreenZoneModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String link;
  @override
  final String summary;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'GreenZoneModel(id: $id, title: $title, link: $link, summary: $summary, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GreenZoneModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, link, summary, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GreenZoneModelImplCopyWith<_$GreenZoneModelImpl> get copyWith =>
      __$$GreenZoneModelImplCopyWithImpl<_$GreenZoneModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GreenZoneModelImplToJson(
      this,
    );
  }
}

abstract class _GreenZoneModel implements GreenZoneModel {
  const factory _GreenZoneModel(
      {required final int id,
      required final String title,
      required final String link,
      required final String summary,
      required final DateTime date}) = _$GreenZoneModelImpl;

  factory _GreenZoneModel.fromJson(Map<String, dynamic> json) =
      _$GreenZoneModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get link;
  @override
  String get summary;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$GreenZoneModelImplCopyWith<_$GreenZoneModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
