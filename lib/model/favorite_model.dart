import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_model.freezed.dart';
part 'favorite_model.g.dart';

@unfreezed
class FavoriteModel with _$FavoriteModel {
  factory FavoriteModel(
      {int? favoriteID,
      required int userID,
      required int productID,
      @Default(true) bool isFavorite,
      int? sellerID}) = _FavoriteModel;
  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);
}
