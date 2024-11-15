import 'package:flutter/material.dart';
import 'package:regain_mobile/datasource/app_data_source.dart';
import 'package:regain_mobile/model/green_zone_model.dart';

class GreenZoneProvider extends ChangeNotifier {
  final AppDataSource _appDataSource = AppDataSource();
  List<GreenZoneModel> _articles = [];
  bool _isLoading = false;
  
  List<GreenZoneModel> get articles => _articles;
  bool get isLoading => _isLoading;
  
  Future<void> getAllArticles() async {

    _isLoading = true;
    notifyListeners();

    try {
      _articles = await _appDataSource.getAllArticles();

      print('Articles fetched successfully: ${_articles.length} articles found.');
    } 
    
    catch (e, stackTrace) {
      print('Stack trace: $stackTrace'); 
    }   

    finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}