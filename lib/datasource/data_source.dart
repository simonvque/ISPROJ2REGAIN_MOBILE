import 'package:regain_mobile/model/category.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/user_model.dart';

abstract class DataSource {
  Future<ResponseModel> addUser(UserModel user);

  Future<ResponseModel> addProduct(Product product);

  Future<List<Category>> getCategories();
}
