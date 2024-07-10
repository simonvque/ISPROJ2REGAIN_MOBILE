import 'dart:convert';

import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/category.dart';
import 'package:regain_mobile/model/error_details_model.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/user_model.dart';
import 'package:http/http.dart' as http;

class AppDataSource extends DataSource {
  // baseUrl = emulator IP + Spring Boot backend port + route
  final String baseUrl = 'http://10.0.2.2:9191/api/';

  // header info for http request
  Map<String, String> get header => {'Content-Type': 'application/json'};

  @override
  Future<ResponseModel> addUser(UserModel user) async {
    // TODO: implement addUser
    final url = '$baseUrl${'user/register'}';
    try {
      final response = await http.post(Uri.parse(url),
          headers: header, body: jsonEncode(user));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  Future<ResponseModel> _getResponseModel(http.Response response) async {
    ResponseStatus status = ResponseStatus.NONE;
    ResponseModel responseModel = ResponseModel();
    if (response.statusCode == 200) {
      status = ResponseStatus.SAVED;
      responseModel = ResponseModel.fromJson(jsonDecode(response.body));
      responseModel.responseStatus = status;
    }
    // else if (response.statusCode == 401 || response.statusCode == 403) {
    //   if (await hasTokenExpired()) {
    //     status = ResponseStatus.EXPIRED;
    //   } else {
    //     status = ResponseStatus.UNAUTHORIZED;
    //   }
    //   responseModel = ResponseModel(
    //     responseStatus: status,
    //     statusCode: 401,
    //     message: 'Access denied. Please login as Admin',
    //   );
    // }
    else if (response.statusCode == 500 || response.statusCode == 400) {
      final json = jsonDecode(response.body);
      final errorDetails = ErrorDetails.fromJson(json);
      status = ResponseStatus.FAILED;
      responseModel = ResponseModel(
        responseStatus: status,
        statusCode: 500,
        message: errorDetails.errorMessage,
      );
    }
    return responseModel;
  }

  @override
  Future<ResponseModel> addProduct(Product product) async {
    final url = '$baseUrl${'products/add'}';
    try {
      final response = await http.post(Uri.parse(url),
          headers: header, body: jsonEncode(product));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<List<Category>> getCategories() async {
    final url = '$baseUrl${'category/list'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => Category.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }
}
