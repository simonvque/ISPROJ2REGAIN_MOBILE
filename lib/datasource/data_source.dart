import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/user_model.dart';

abstract class DataSource {
  Future<ResponseModel> addUser(UserModel user);
}
