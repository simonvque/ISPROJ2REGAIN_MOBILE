import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_update_model.freezed.dart';
part 'user_profile_update_model.g.dart';

@unfreezed
class UserProfileUpdateModel with _$UserProfileUpdateModel {
  factory UserProfileUpdateModel({
    int? id,
    @Default('') String? firstName,
    @Default('') String? lastName,
    required String username,
    @Uint8ListConverter() Uint8List? profileImage,
    @Uint8ListConverter() Uint8List? gcashQRcode,
    @Default('') String? junkshopName,
    //@Uint8ListConverter() Uint8List? image, ---> causes dart build_runner to error due to null check. May be due to the type coverter
  }) = _UserProfileUpdateModel;
  factory UserProfileUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileUpdateModelFromJson(json);
}

// Custom converter for Uint8List
class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) => base64Decode(json);

  @override
  String toJson(Uint8List object) => base64Encode(object);
}
