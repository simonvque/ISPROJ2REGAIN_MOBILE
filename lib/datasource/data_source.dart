import 'package:regain_mobile/model/response_model.dart';

import '../model/User.dart';

abstract class DataSource {
  Future<ResponseModel> addUser(User user);
}
