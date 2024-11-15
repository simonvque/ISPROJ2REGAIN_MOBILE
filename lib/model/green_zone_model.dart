import 'package:freezed_annotation/freezed_annotation.dart';

part 'green_zone_model.freezed.dart';
part 'green_zone_model.g.dart';

@freezed
class GreenZoneModel with _$GreenZoneModel {
  const factory GreenZoneModel({
    required int id,
    required String title,
    required String link,
    required String summary,
    required DateTime date,
  }) = _GreenZoneModel;

  factory GreenZoneModel.fromJson(Map<String, dynamic> json) => _$GreenZoneModelFromJson(json);
}
