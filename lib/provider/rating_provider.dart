import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/model/rating_model.dart';
import 'package:regain_mobile/model/response_model.dart';

class RatingProvider extends ChangeNotifier {
  final AppDataSource _dataSource = AppDataSource();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // addRating method 
  Future<ResponseModel> addRating(Map<String, dynamic> ratingPayload) async {
    _isLoading = true;
    notifyListeners();

    try {
      ResponseModel response = await _dataSource.addRating(ratingPayload);

      return response; 
    } catch (error) {
      print('Error submitting rating: $error');
      rethrow;
    } finally {
      _isLoading = false;  
      notifyListeners();  
    }
  }

  // Get seller ratings method
  Future<List<Rating>> getSellerRatings(int userId) async {
    try {
      // Instead of returning List<dynamic>, return List<Rating>
      List<Rating> ratings = await _dataSource.getSellerRatings(userId);
      return ratings;
    } catch (error) {
      print('Error fetching seller ratings: $error');
      rethrow;
    }
  }
}
