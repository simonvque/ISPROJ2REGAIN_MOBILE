import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart'; // Your data source class
import 'package:regain_mobile/model/response_model.dart'; // Your response model

class ForgotPasswordProvider extends ChangeNotifier {
  final AppDataSource _appDataSource = AppDataSource();

  bool _isLoading = false;
  String _errorMessage = '';
  String _successMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;

  set errorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  set successMessage(String message) {
    _successMessage = message;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Request password reset method
  Future<void> requestPasswordReset(String email) async {
    _isLoading = true;
    _errorMessage = '';
    _successMessage = '';
    notifyListeners();

    try {
      ResponseModel response = await _appDataSource.requestPasswordReset(email);

      if (response.statusCode == 200) {
        _successMessage = 'Password reset link has been sent to your email.';
      } else {
        _errorMessage = 'Failed to send password reset email: ${response.response['message'] ?? response.response.toString()}';
    }
    } catch (error) {
      _errorMessage = 'An error occurred: $error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Verify OTP method
  Future<void> verifyOtp(String otp) async {
    _isLoading = true;
    _errorMessage = '';
    _successMessage = '';
    notifyListeners();

    try {
      ResponseModel response = await _appDataSource.verifyOtp(otp);

      if (response.statusCode == 200) {
        _successMessage = 'OTP verified successfully.';
      } else {
        _errorMessage = 'Failed to verify OTP: ${response.response['message'] ?? response.response.toString()}';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Reset password method
  Future<void> resetPassword(String otp, String newPassword) async {
    _isLoading = true;
    _errorMessage = '';
    _successMessage = '';
    notifyListeners();

    try {
      ResponseModel response = await _appDataSource.resetPassword(otp, newPassword);

      if (response.statusCode == 200) {
        _successMessage = 'Password has been successfully reset.';
      } else {
        _errorMessage = 'Failed to reset password: ${response.response}';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
