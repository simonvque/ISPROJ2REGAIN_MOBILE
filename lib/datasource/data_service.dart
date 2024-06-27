import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/entities/response_model.dart';
import 'package:regain_mobile/entities/user_model.dart';

class DataService extends DataSource {
  @override
  Future<ResponseModel> addUser(UserModel user) async {
    // TODO: implement addUser
    return ResponseModel(
        responseStatus: ResponseStatus.SAVED,
        statusCode: 200,
        message: 'User registered successfully',
        object: {});
  }
}
