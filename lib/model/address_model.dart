import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@unfreezed
class AddressModel with _$AddressModel {
  factory AddressModel(
      {int? addressID,
      @Default('') String? unitNumber,
      required String street,
      required String barangay,
      required String city,
      required String province,
      required String zipCode,
      required int userID}) = _AddressModel;
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
