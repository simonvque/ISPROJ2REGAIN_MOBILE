import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:regain_mobile/datasource/Uint8ListConverter.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@unfreezed
class UserModel with _$UserModel {
  factory UserModel({
    int? id,
    int? role,
    String? firstName,
    String? lastName,
    required String username,
    required String contactNumber,
    required String password,
    String? email,
    int? address,
    @Default('Active') String accountStatus,
    int? penaltyPoints,
    double? commissionBalance,

    //@Uint8ListConverter() Uint8List? image, ---> causes dart build_runner to error due to null check. May be due to the type coverter
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
