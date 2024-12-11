import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:regain_mobile/constants/ENUMS.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/datasource/data_source.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/user_id_model.dart';
import 'package:regain_mobile/model/user_model.dart';
import 'package:regain_mobile/model/user_profile_update_model.dart';

class AppDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();

  late int? _userId;

  get userId => _userId;

  late UserModel? _user;

  UserModel? get user => _user;

  void resetUser() {
    _user = null;
    _userId = null;
    notifyListeners();
  }

  Future<ResponseModel> addUser(UserModel user) {
    // insert some logic?

    return _dataSource.addUser(user);
  }

  Future<ResponseModel> addUserID(UserIDModel userID) {
    return _dataSource.addUserID(userID);
  }

  Future<ResponseModel> login(UserModel userDTO) async {
    ResponseModel response = await _dataSource.login(userDTO);
    if (response.statusCode == 200) {
      _user = UserModel.fromJson(response.response);
      _userId = user?.id;
    }

    notifyListeners();
    return response;
    // _userId = response.object.
  }

  Future<ResponseModel> deleteUser(int id, UserModel userDTO) async {
    return _dataSource.deleteUser(id, userDTO);
  }

  Future<ResponseModel> updateUserProfile(
    UserProfileUpdateModel userProfileDTO, {
    File? profileImage,
    File? gcashQRcode,
    BuildContext? context, // Optional for showing errors
  }) async {
    // Validate profile image
    if (profileImage != null && !validateImage(profileImage)) {
      handleError(
          context, 'Invalid profile image. Must be JPEG/PNG and under 2 MB.');
      return ResponseModel(
        responseStatus: ResponseStatus.FAILED,
        message: 'Profile image validation failed.',
      );
    }

    // Validate GCASH QR code
    if (gcashQRcode != null && !validateImage(gcashQRcode)) {
      handleError(context,
          'Invalid GCASH QR code image. Must be JPEG/PNG and under 2 MB.');
      return ResponseModel(
        responseStatus: ResponseStatus.FAILED,
        message: 'GCASH QR code validation failed.',
      );
    }

    try {
      // Call the data source method with updated parameters
      final response = await _dataSource.updateUser(
          userProfileDTO, profileImage, gcashQRcode);

      if (response.statusCode == 200) {
        // Update the local user object with the response data
        _user = UserModel.fromJson(response.response);
        _userId = _user?.id;
        notifyListeners();
      }

      return response;
    } catch (e) {
      handleError(context, 'An unexpected error occurred: $e');
      return ResponseModel(
        responseStatus: ResponseStatus.FAILED,
        message: 'An unexpected error occurred.',
      );
    }
  }

  void handleError(BuildContext? context, String errorMessage) {
    debugPrint("Error: $errorMessage");

    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(errorMessage, style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  bool validateImage(File image) {
    const maxSize = 2 * 1024 * 1024; // 2 MB
    const allowedFormats = ['jpeg', 'jpg', 'png'];

    if (image.lengthSync() > maxSize) return false;

    final mimeType = lookupMimeType(image.path);
    if (mimeType == null ||
        !allowedFormats.contains(mimeType.split('/').last)) {
      return false; // Invalid format
    }

    return true;
  }

  Future<Uint8List?> fetchSellerProfileImage(String username) async {
    try {
      final dataSource = AppDataSource();
      final profileImage = await dataSource.getSellerProfileImage(username);
      return profileImage;
    } catch (error) {
      debugPrint("Error fetching profile image for $username: $error");
      return null; // Return null on failure
    }
  }

  getUsernameById(int ratedUserId) {}
}
