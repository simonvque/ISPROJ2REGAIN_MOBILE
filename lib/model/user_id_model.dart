import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:regain_mobile/model/user_model.dart';

part 'user_id_model.freezed.dart';
part 'user_id_model.g.dart';

@unfreezed
class UserIDModel with _$UserIDModel {
  factory UserIDModel({
    int? id,
    required UserModel user,
    String? idType,
    String? idNumber,
    String? idImage,

    //@Uint8ListConverter() Uint8List? image, ---> causes dart build_runner to error due to null check. May be due to the type coverter
  }) = __UserIDModel;
  factory UserIDModel.fromJson(Map<String, dynamic> json) =>
      _$UserIDModelFromJson(json);
}
