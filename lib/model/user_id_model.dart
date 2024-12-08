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
  }) = __UserIDModel;
  factory UserIDModel.fromJson(Map<String, dynamic> json) =>
      _$UserIDModelFromJson(json);
}
