import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart'; 

part 'rating_model.freezed.dart';
part 'rating_model.g.dart';

@freezed
class Rating with _$Rating {
  const factory Rating({
    required int ratingId,
    required int ratedUserId,
    required int ratedByUserId,
    required int rateValue,
    required String comments,
    required DateTime dateCreated,
    DateTime? dateEdited, 
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) =>
      _$RatingFromJson(json);
}
