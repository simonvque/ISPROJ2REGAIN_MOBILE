import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
//import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/address_model.dart';
import 'package:regain_mobile/model/category.dart';
import 'package:regain_mobile/model/error_details_model.dart';
import 'package:regain_mobile/model/green_zone_model.dart';
import 'package:regain_mobile/model/favorite_model.dart';
import 'package:regain_mobile/model/order_log.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/rating_model.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/user_id_model.dart';
import 'package:regain_mobile/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:regain_mobile/model/user_profile_update_model.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/model/viewoffers_model.dart';

class AppDataSource extends DataSource {
  static final AppDataSource _instance = AppDataSource._privateConstructor();

  factory AppDataSource() {
    return _instance;
  }

  AppDataSource._privateConstructor();

  // for cloud
  final _ipAddPort = '159.223.37.215:40002';
  // final _ipAddPort = '192.168.1.4:9191';

  get ipAddPort => _ipAddPort;

  // baseUrl = emulator IP + Spring Boot backend port + route
  final String baseUrl = 'http://159.223.37.215:40002/api/';
  // final String baseUrl = 'http://192.168.1.4:9191/api/';

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
  Future<ResponseModel> updateUser(UserProfileUpdateModel userProfile,
      File? profileImage, File? gcashQRcode) async {
    final url = '$baseUrl${'user/update'}';

    try {
      // Create a multipart request
      final request = http.MultipartRequest('PUT', Uri.parse(url));

      // Add fields to the request
      request.fields['id'] = userProfile.id?.toString() ?? '';
      request.fields['firstName'] = userProfile.firstName ?? '';
      request.fields['lastName'] = userProfile.lastName ?? '';
      request.fields['username'] = userProfile.username;
      request.fields['junkshopName'] = userProfile.junkshopName ?? '';

      // Add profileImage if provided
      if (profileImage != null) {
        final mimeType = lookupMimeType(
            profileImage.path); // Dynamically determine MIME type
        request.files.add(
          await http.MultipartFile.fromPath(
            'profileImage',
            profileImage.path,
            contentType: mimeType != null ? MediaType.parse(mimeType) : null,
          ),
        );
      } else if (userProfile.profileImage != null) {
        // Convert Uint8List to base64 and send as a field
        request.fields['profileImage'] =
            base64Encode(userProfile.profileImage!);
      }

      // Add gcashQRcode if provided
      if (gcashQRcode != null) {
        final mimeType =
            lookupMimeType(gcashQRcode.path); // Dynamically determine MIME type
        request.files.add(
          await http.MultipartFile.fromPath(
            'gcashQRcode',
            gcashQRcode.path,
            contentType: mimeType != null ? MediaType.parse(mimeType) : null,
          ),
        );
      } else if (userProfile.gcashQRcode != null) {
        // Convert Uint8List to base64 and send as a field
        request.fields['gcashQRcode'] = base64Encode(userProfile.gcashQRcode!);
      }

      print('Request payload fields: ${request.fields}');

      // Send the request and wait for a response
      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      // Handle response
      if (response.statusCode == 200) {
        return ResponseModel(
          responseStatus: ResponseStatus.SAVED,
          message: 'User updated successfully.',
          response: json.decode(responseData.body),
        );
      } else {
        return ResponseModel(
          responseStatus: ResponseStatus.FAILED,
          message: 'Failed to update user: ${responseData.body}',
        );
      }
    } catch (e) {
      return ResponseModel(
        responseStatus: ResponseStatus.FAILED,
        message: 'An unexpected error occurred. Please try again later.',
      );
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
    if (response.statusCode == 200) {
      status = ResponseStatus.SAVED;

      responseModel = ResponseModel.fromJson(jsonDecode(response.body));
      // UserModel userM = UserModel.fromJson(jsonDecode(response.body["response"]));
      responseModel.responseStatus = status;
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      // if (response.statusCode == 403) {
      //   status = ResponseStatus.EXPIRED;
      // } else {
      //   status = ResponseStatus.UNAUTHORIZED;
      // }
      status = ResponseStatus.UNAUTHORIZED;
      //final json = jsonDecode(response.body);
      //final errorDetails = ErrorDetails.fromJson(json);
      // responseModel = ResponseModel(
      //   responseStatus: status,
      //   statusCode: 401,
      //   message: 'Access denied. Please login as Admin',
      // );
      final json = jsonDecode(response.body);
      final errorDetails = ErrorDetails.fromJson(json);
      responseModel = ResponseModel(
        responseStatus: status,
        statusCode: response.statusCode,
        message: errorDetails.errorMessage,
      );
    } else if (response.statusCode == 500 || response.statusCode == 400) {
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

  void logFileDetails(File image) {
    final mimeType = lookupMimeType(image.path);
    debugPrint("File Path: ${image.path}");
    debugPrint("MIME Type: $mimeType");
  }

  @override
  Future<ResponseModel> addProduct(Product product, File? image) async {
    final url = '$baseUrl${'products/add'}';

    // Log the file details before adding it to the request
    if (image != null) {
      logFileDetails(image);
    }

    try {
      // Create a multipart request
      final request = http.MultipartRequest('POST', Uri.parse(url));

      // Add fields to the request
      request.fields['productName'] = product.productName;
      request.fields['description'] = product.description ?? '';
      request.fields['weight'] = product.weight;
      request.fields['location'] = product.location.toString();
      request.fields['categoryID'] = product.categoryID.toString();
      request.fields['price'] = product.price;
      request.fields['canDeliver'] = product.canDeliver.toString();
      request.fields['sellerID'] = product.sellerID.toString();

      // Add the image file, if provided
      if (image != null) {
        final mimeType = lookupMimeType(image.path);
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            image.path,
            contentType: mimeType != null ? MediaType.parse(mimeType) : null,
          ),
        );
      }

      // Send the request and wait for a response
      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      // Handle response
      if (response.statusCode == 200) {
        return ResponseModel(
          responseStatus: ResponseStatus.SAVED,
          message: responseData.body,
        );
      } else {
        return ResponseModel(
          responseStatus: ResponseStatus.FAILED,
          message: responseData.body,
        );
      }
    } catch (e) {
      debugPrint('Error adding product: $e');
      throw Exception('Error adding product: $e');
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
  Future<ResponseModel> updateProduct(
      int id, Product product, File? image) async {
    final url = '$baseUrl${'products/update/$id'}';

    try {
      // Create a multipart request
      final request = http.MultipartRequest('PUT', Uri.parse(url));

      // Add fields to the request
      request.fields['productName'] = product.productName;
      request.fields['description'] = product.description ?? '';
      request.fields['weight'] = product.weight;
      request.fields['location'] = product.location.toString();
      request.fields['categoryID'] = product.categoryID.toString();
      request.fields['price'] = product.price;
      request.fields['canDeliver'] = product.canDeliver.toString();
      request.fields['sellerID'] = product.sellerID.toString();

      // Add the image file, if provided
      if (image != null) {
        final mimeType = lookupMimeType(image.path); // Use lookupMimeType
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            image.path,
            contentType: mimeType != null ? MediaType.parse(mimeType) : null,
          ),
        );
      }

      // Send the request and wait for a response
      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      // Handle response
      if (response.statusCode == 200) {
        return ResponseModel(
          responseStatus: ResponseStatus.SAVED,
          message: responseData.body,
        );
      } else {
        return ResponseModel(
          responseStatus: ResponseStatus.FAILED,
          message: responseData.body,
        );
      }
    } catch (e) {
      throw Exception('Error updating product: $e');
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
  Future<ResponseModel> updateOrder(OrderModel order, int id) async {
    final url = '$baseUrl${'orders/update/$id'}';
    try {
      final response = await http.put(Uri.parse(url),
          headers: header, body: jsonEncode(order));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<List<OrderModel>> getOrdersByDeliveryBuyer(int id) async {
    final url = '$baseUrl${'orders/buyer/$id'}';
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
  Future<List<OrderModel>> getOrdersByDeliverySeller(int id) async {
    final url = '$baseUrl${'orders/seller/$id'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => OrderModel.fromJson(mapList[index]));
      } else {
        return [];
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<OrderLog>> getOrderLogsByOrderId(int id) async {
    final url = '$baseUrl${'orders/logs/$id'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => OrderLog.fromJson(mapList[index]));
      } else {
        return [];
      }
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
        print('Failed to fetch articles. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return [];
      }
    } catch (error) {
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
      String? category, int userId) async {
    final url = category == null || category.isEmpty
        ? '$baseUrl${'products/view/filter/all?userId=$userId'}'
        : '$baseUrl${'products/view/filter'}?category=$category&userId=$userId';

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
  Future<ResponseModel> requestPasswordReset(String email) async {
    final url = '$baseUrl${'password/request-reset'}';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        return await _getResponseModel(response);
      } else {
        throw Exception('Failed to request password reset: ${response.body}');
      }
    } catch (error) {
      print('Error during password reset request: $error');
      rethrow;
    }
  }

  @override
  Future<ResponseModel> resetPassword(String otp, String newPassword) async {
    final url = '$baseUrl${'password/reset'}';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode({'otp': otp, 'newPassword': newPassword}),
      );

      if (response.statusCode == 200) {
        return await _getResponseModel(response);
      } else {
        throw Exception('Failed to reset password: ${response.body}');
      }
    } catch (error) {
      print('Error during password reset: $error');
      rethrow;
    }
  }

  @override
  Future<ResponseModel> verifyOtp(String otp) async {
    final url = '$baseUrl${'password/verify-otp'}';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode({'otp': otp}),
      );

      if (response.statusCode == 200) {
        return await _getResponseModel(response);
      } else {
        throw Exception('Failed to verify OTP: ${response.body}');
      }
    } catch (error) {
      print('Error during OTP verification: $error');
      rethrow;
    }
  }

  Future<ResponseModel> addListingReport(
      Map<String, dynamic> reportPayload) async {
    final url = '$baseUrl${'listingreports/add'}';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(reportPayload),
      );
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
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

  Future<ResponseModel> addUserReport(
      Map<String, dynamic> reportPayload) async {
    final url = '$baseUrl${'userreports/add'}';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(reportPayload),
      );
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  Future<int> getPenaltyPoints(int userId) async {
    final url = '$baseUrl${'user/$userId/penalty-points'}';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: header,
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['response'] as int? ??
            0; // Extract penalty points from 'response'
      } else {
        throw Exception(
            'Failed to fetch penalty points: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching penalty points: $error');
      rethrow;
    }
  }

  @override
  Future<Uint8List?> getSellerProfileImage(String username) async {
    final url = '$baseUrl${'user/profile-image/$username'}';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Decode the Base64 image
        return base64Decode(response.body);
      } else {
        print('Failed to fetch profile image for username: $username');
        print('Status Code: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (error) {
      print('Error occurred while fetching profile image: $error');
    }
    return null; // Return null if no image is found or an error occurs
  }

  Future<Map<String, List<dynamic>>> getUserAndListingReports(
      int userId) async {
    final url = '$baseUrl${'user/$userId/reports'}';
    try {
      final response = await http.get(Uri.parse(url), headers: header);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return data
            .map((key, value) => MapEntry(key, List<dynamic>.from(value)));
      }
      return {};
    } catch (error) {
      print('Error fetching reports: $error');
      rethrow;
    }
  }

  Future<ResponseModel> addRating(Map<String, dynamic> ratingPayload) async {
  final url = '$baseUrl${'rating/add'}'; 
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: header, 
      body: jsonEncode(ratingPayload),
    );

    return await _getResponseModel(response); 
  } catch (error) {
    print('Error adding rating: $error');
    rethrow;  
  }
}

Future<List<Rating>> getSellerRatings(int userId) async { 
  final url = '$baseUrl${'rating/user/$userId'}'; 

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: header,
    );

    if (response.statusCode == 200) {
      // Parse the response body into a list of Rating objects
      List<dynamic> responseList = jsonDecode(response.body);
      List<Rating> ratings = responseList
          .map((ratingJson) => Rating.fromJson(ratingJson))
          .toList();  // Convert each JSON object into Rating

      return ratings;
    } else {
      throw Exception('Failed to fetch ratings: ${response.body}');
    }
  } catch (error) {
    print('Error fetching seller ratings: $error');
    rethrow;
  }
}

// Future<void> updateComment(String comment, String newComment) async {
  
//   // Fetch all ratings
//   List<Rating> ratings = await getSellerRatings(userId);

//   // Find the rating ID by matching the comment
//   Rating? targetRating = ratings.firstWhere(
//       (rating) => rating.comments == comment);

//   final url = '$baseUrl/rating/update-comment/${targetRating.ratingId}';
//   final response = await http.put(
//     Uri.parse(url),
//     headers: header,
//     body: jsonEncode({"comments": newComment}),
//   );

//   if (response.statusCode == 200) {
//     print('Comment updated successfully');
//   } else {
//     print('Failed to update comment');
//   }
// }

}
