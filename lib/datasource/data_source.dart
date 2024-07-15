import 'package:flutter/material.dart';
import 'package:regain_mobile/model/address_model.dart';
import 'package:regain_mobile/model/category.dart';
import 'package:regain_mobile/model/offers_model.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/user_model.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/model/viewoffers_model.dart';

abstract class DataSource {
  Future<ResponseModel> addUser(UserModel user);

  Future<ResponseModel> addAddress(AddressModel address);

  Future<List<AddressModel>> getAddressesByUser(int id);

  Future<ResponseModel> deleteAddress(int id);

  Future<ResponseModel> addProduct(Product product);

  Future<Product?> getProductById(int id);

  Future<List<Product>> getAllProducts();

  Future<List<Product>> getProductsByUser(int id);

  Future<List<ViewProduct>> getAllProductsByUserFave(int id);

  Future<List<Category>> getCategories();

  Future<List<ViewOffersModel>> getOffersByBuyerID(int id);

  Future<List<ViewOffersModel>> getOffersByProductID(int id);
}
