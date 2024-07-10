import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@unfreezed
class Category with _$Category {
  factory Category({int? categoryID, required String categoryName}) = _Category;
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
