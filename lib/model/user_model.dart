import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@unfreezed
class UserModel with _$UserModel {
  factory UserModel({
    int? id,
    @Default('') String role,
    @Default('') String? firstName,
    @Default('') String? lastName,
    required String username,
    required String password,
    @Default('') String? email,
    @Default('Pending') String accountStatus,
    @Default(0) int? penaltyPoints,
    String? phone,
    @Default('') String? profileImagePath,
    @Uint8ListConverter() Uint8List? profileImage,
    @Default('') String? gcashQR,
    @Uint8ListConverter() Uint8List? gcashQRcode,
    DateTime? birthday,
    @Default('') String? junkshopName,
    //@Uint8ListConverter() Uint8List? image, ---> causes dart build_runner to error due to null check. May be due to the type coverter
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

// Custom converter for Uint8List
class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) => base64Decode(json);

  @override
  String toJson(Uint8List object) => base64Encode(object);
}
