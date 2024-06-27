import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:regain_mobile/datasource/Uint8ListConverter.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@unfreezed
class UserModel with _$UserModel {
  factory UserModel({
    int? id,
    @Default(2) int? role,
    @Default('') String? firstName,
    @Default('') String? lastName,
    required String username,
    required String contactNumber,
    required String password,
    @Default('') String? email,
    int? address,
    @Default('Active') String accountStatus,
    @Default(0) int? penaltyPoints,
    @Default(0.00) double? commissionBalance,
    @Default('') String? junkshopName,

    //@Uint8ListConverter() Uint8List? image, ---> causes dart build_runner to error due to null check. May be due to the type coverter
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
