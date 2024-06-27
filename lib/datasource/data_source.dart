import 'package:regain_mobile/entities/response_model.dart';
import 'package:regain_mobile/entities/user_model.dart';

abstract class DataSource {
  Future<ResponseModel> addUser(UserModel user);
}
