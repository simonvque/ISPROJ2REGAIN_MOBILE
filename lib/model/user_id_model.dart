// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'user_id_model.freezed.dart';
// part 'user_id_model.g.dart';

// @unfreezed
// class UserIDModel with _$UserModel {
//   factory UserModel({
//     int? id,
//     @Default('') String role,
//     @Default('') String? firstName,
//     @Default('') String? lastName,
//     required String username,
//     required String password,
//     @Default('') String? email,
//     @Default('Pending') String accountStatus,
//     @Default(0) int? penaltyPoints,
//     @Default('') String? junkshopName,

//     //@Uint8ListConverter() Uint8List? image, ---> causes dart build_runner to error due to null check. May be due to the type coverter
//   }) = _UserModel;
//   factory UserModel.fromJson(Map<String, dynamic> json) =>
//       _$UserModelFromJson(json);
// }
