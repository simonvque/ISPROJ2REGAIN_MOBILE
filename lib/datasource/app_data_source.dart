import 'dart:convert';
//import 'dart:js_interop';

import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/address_model.dart';
import 'package:regain_mobile/model/category.dart';
import 'package:regain_mobile/model/error_details_model.dart';
import 'package:regain_mobile/model/green_zone_model.dart';
import 'package:regain_mobile/model/favorite_model.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/user_id_model.dart';
import 'package:regain_mobile/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/model/viewoffers_model.dart';

class AppDataSource extends DataSource {
  static final AppDataSource _instance = AppDataSource._privateConstructor();

  factory AppDataSource() {
    return _instance;
  }

  AppDataSource._privateConstructor();

  // final _ipAddPort = '159.223.37.215:40002';
  final _ipAddPort = '192.168.68.105:9191';

  get ipAddPort => _ipAddPort;

  // baseUrl = emulator IP + Spring Boot backend port + route
  // final String baseUrl = 'http://159.223.37.215:40002/api/';

  final String baseUrl = 'http://192.168.68.105:9191/api/';

  // header info for http request
  Map<String, String> get header => {'Content-Type': 'application/json'};

  @override
  Future<ResponseModel> addUser(UserModel user) async {
    final url = '$baseUrl${'register'}';
    try {
      final response = await http.post(Uri.parse(url),
          headers: header, body: jsonEncode(user));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<ResponseModel> login(UserModel user) async {
    final url = '$baseUrl${'login'}';
    try {
      final response = await http.post(Uri.parse(url),
          headers: header, body: jsonEncode(user));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<ResponseModel> updateUser(UserModel user) async {
    final url = '$baseUrl${'user/update'}';
    try {
      final response = await http.put(Uri.parse(url),
          headers: header, body: jsonEncode(user));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  // @override
  // Future<UserModel?> getUserById(int id) async {
  //   final url = '$baseUrl${'user/$id'}';
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode == 200) {
  //       final map = json.decode(response.body);
  //       return UserModel.fromJson(map);
  //     }
  //     return null;
  //   } catch (error) {
  //     rethrow;
  //   }
  // }

  Future<ResponseModel> _getResponseModel(http.Response response) async {
    ResponseStatus status = ResponseStatus.NONE;
    ResponseModel responseModel = ResponseModel();
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    if (response.statusCode == 200) {
      status = ResponseStatus.SAVED;

      responseModel = ResponseModel.fromJson(jsonDecode(response.body));
      // UserModel userM = UserModel.fromJson(jsonDecode(response.body["response"]));
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

  // ADDRESS
  @override
  Future<ResponseModel> addAddress(AddressModel address) async {
    final url = '$baseUrl${'addresses/add'}';
    try {
      final response = await http.post(Uri.parse(url),
          headers: header, body: jsonEncode(address));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<List<AddressModel>> getAddressesByUser(int id) async {
    final url = '$baseUrl${'addresses/user/$id'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => AddressModel.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<ResponseModel> deleteAddress(int id) async {
    final url = '$baseUrl${'addresses/$id'}';
    try {
      final response = await http.delete(Uri.parse(url));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  // PRODUCTS
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
  Future<ResponseModel> deleteProduct(int id) async {
    final url = '$baseUrl${'products/delete/$id'}';
    try {
      final response = await http.delete(Uri.parse(url));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<ResponseModel> updateProduct(int id, Product product) async {
    final url = '$baseUrl${'products/update/$id'}';
    try {
      final response = await http.put(Uri.parse(url),
          headers: header, body: jsonEncode(product));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<List<Product>> getAllProducts() async {
    final url = '$baseUrl${'products/list'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => Product.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<ViewProduct>> getAllProductsByUserFave(int id) async {
    final url = '$baseUrl${'products/viewlist/$id'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => ViewProduct.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<ViewProduct>> getViewProductsByUser(int id) async {
    final url = '$baseUrl${'products/userviewlist/$id'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => ViewProduct.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<Product>> getProductsByUser(int id) async {
    final url = '$baseUrl${'products/list/$id'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => Product.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }

  //   @override
  // Future<List<ViewProduct>> getProductsByUser(int id) async {
  //   final url = '$baseUrl${'products/list/$id'}';
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode == 200) {
  //       final mapList = json.decode(response.body) as List;
  //       return List.generate(
  //           mapList.length, (index) => ViewProduct.fromJson(mapList[index]));
  //     }
  //     return [];
  //   } catch (error) {
  //     rethrow;
  //   }
  // }

  @override
  Future<Product?> getProductById(int id) async {
    final url = '$baseUrl${'products/$id'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final map = json.decode(response.body);
        return Product.fromJson(map);
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  // FAVORITES
  @override
  Future<List<ViewProduct>> getUserFavorites(int id) async {
    final url = '$baseUrl${'favorites/list/$id'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => ViewProduct.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }

  // CATEGORIES
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

  @override
  Future<List<ViewOffersModel>> getOffersByBuyerID(int id) async {
    final url = '$baseUrl${'offers/buyer/$id/viewoffers'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(mapList.length,
            (index) => ViewOffersModel.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<ViewOffersModel>> getOffersByProductID(int id) async {
    final url = '$baseUrl${'offers/product/$id/viewoffers'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(mapList.length,
            (index) => ViewOffersModel.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }

  // FAVORITES
  @override
  Future<ResponseModel> addFavorite(FavoriteModel fave) async {
    final url = '$baseUrl${'favorites/add'}';
    try {
      final response = await http.post(Uri.parse(url),
          headers: header, body: jsonEncode(fave));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<ResponseModel> deleteFavorite(int userId, int prodId) async {
    final url = '$baseUrl${'favorites/delete/$userId/$prodId'}';
    try {
      final response = await http.delete(Uri.parse(url));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<ResponseModel> deleteOffers(int id) async {
    final url = '$baseUrl${'offers/$id'}';
    try {
      final response = await http.delete(Uri.parse(url));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<ResponseModel> addOffers(ViewOffersModel offers) async {
    final url = '$baseUrl${'offers/add'}';
    try {
      final response = await http.post(Uri.parse(url),
          headers: header, body: jsonEncode(offers));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<ResponseModel> updateOffers(
      int id, ViewOffersModel updatedOffer) async {
    final url = '$baseUrl${'offers/$id'}';
    try {
      final response = await http.put(Uri.parse(url),
          headers: header, body: jsonEncode(updatedOffer));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<ResponseModel> addOrder(OrderModel order) async {
    final url = '$baseUrl${'orders/add'}';
    try {
      final response = await http.post(Uri.parse(url),
          headers: header, body: jsonEncode(order));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<List<OrderModel>> getOrdersByDeliveryBuyer(
      String method, int id) async {
    final url = '$baseUrl${'orders/buyer/$id/$method'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => OrderModel.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<OrderModel>> getOrdersByDeliverySeller(
      String method, int id) async {
    final url = '$baseUrl${'orders/seller/$id/$method'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => OrderModel.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }

  //GreenZone
  @override
  Future<List<GreenZoneModel>> getAllArticles() async {
    final url = '$baseUrl${'green_zone/articles'}';
    try {
      final response = await http.get(Uri.parse(url));
      print('Attempting to fetch articles from: $url');

      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        print(
            'Articles fetched successfully: ${mapList.length} articles found.');

        return List.generate(
            mapList.length, (index) => GreenZoneModel.fromJson(mapList[index]));
      } else {
        // Log error if the status code is not 200
        print('Failed to fetch articles. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return [];
      }
    } catch (error) {
      // Log the exact error and rethrow to handle it at the call site
      print('Error occurred while fetching articles: $error');
      rethrow;
    }
  }

  @override
  Future<ResponseModel> addUserID(UserIDModel userID) async {
    final url = '$baseUrl${'user/addID'}';
    try {
      final response = await http.post(Uri.parse(url),
          headers: header, body: jsonEncode(userID));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<List<ViewProduct>> getFilteredProductsByCategory(
      String category, int userId) async {
    final url =
        '$baseUrl${'products/view/filter'}?category=$category&userId=$userId';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => ViewProduct.fromJson(mapList[index]));
      } else {
        print(
            'Failed to fetch products for category: $category and userId: $userId');
        print('Status Code: ${response.statusCode}, Body: ${response.body}');
        return [];
      }
    } catch (error) {
      print('Error occurred while fetching filtered products: $error');
      rethrow;
    }
  }

  @override
  Future<List<ViewProduct>> searchProducts(String query, int userId) async {
    final url = '$baseUrl${'products/search'}?query=$query&userId=$userId';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => ViewProduct.fromJson(mapList[index]));
      } else {
        print('Failed to fetch products for query: $query and userId: $userId');
        print('Status Code: ${response.statusCode}, Body: ${response.body}');
        return [];
      }
    } catch (error) {
      print('Error occurred while searching products: $error');
      rethrow;
    }
  }
}
