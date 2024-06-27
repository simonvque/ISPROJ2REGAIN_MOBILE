import 'package:regain_mobile/constants/ENUMS.dart';

//@unfreezed
class ResponseModel {
  ResponseStatus responseStatus;
  int statusCode;
  String message;
  Map<String, dynamic> object;

  ResponseModel(
      {required this.responseStatus,
      required this.statusCode,
      required this.message,
      required this.object});
}


// import 'package:freezed_annotation/freezed_annotation.dart';

// @unfreezed
// class ResponseModel with _$ResponseModel {
//   factory ResponseModel({
//     @Default(ResponseStatus.SAVED) ResponseStatus responseStatus,
//     @Default(200) int statusCode,
//     @Default('Saved') String message,
//     @Default({}) Map<String, dynamic> object,
//   }) = _ResponseModel;
//   factory ResponseModel.fromJson(Map<String, dynamic> json) =>
//       _$ResponseModelFromJson(json);
// }
