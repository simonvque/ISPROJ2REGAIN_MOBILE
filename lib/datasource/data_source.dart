import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'package:regain_mobile/model/address_model.dart';
import 'package:regain_mobile/model/category.dart';
import 'package:regain_mobile/model/favorite_model.dart';
import 'package:regain_mobile/model/green_zone_model.dart';
import 'package:regain_mobile/model/offers_model.dart';
import 'package:regain_mobile/model/order_log.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/user_id_model.dart';
import 'package:regain_mobile/model/user_model.dart';
import 'package:regain_mobile/model/user_profile_update_model.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/model/viewoffers_model.dart';

abstract class DataSource {
  Future<ResponseModel> addUser(UserModel user);

  Future<ResponseModel> addUserID(UserIDModel userID);

  Future<ResponseModel> updateUser(UserProfileUpdateModel userProfile,
      File? profileImage, File? gcashQRcode);

  // Future<UserModel?> getUserById(int id);

  Future<ResponseModel> login(UserModel user);

  Future<ResponseModel> addAddress(AddressModel address);

  Future<List<AddressModel>> getAddressesByUser(int id);

  Future<ResponseModel> deleteAddress(int id);

  Future<ResponseModel> addProduct(Product product, File? image);

  Future<ResponseModel> updateProduct(int id, Product product, File? image);

  Future<ResponseModel> deleteProduct(int id);

  Future<Product?> getProductById(int id);

  Future<List<Product>> getAllProducts();

  Future<List<Product>> getProductsByUser(int id);

  Future<List<ViewProduct>> getViewProductsByUser(int id);

  Future<List<ViewProduct>> getAllProductsByUserFave(int id);

  Future<List<ViewProduct>> getUserFavorites(int id);

  Future<ResponseModel> addFavorite(FavoriteModel fave);

  Future<ResponseModel> deleteFavorite(int userId, int prodId);

  Future<List<Category>> getCategories();

  Future<List<ViewOffersModel>> getOffersByBuyerID(int id);

  Future<List<ViewOffersModel>> getOffersByProductID(int id);

  Future<ResponseModel> deleteOffers(int id);

  Future<ResponseModel> updateOffers(int id, ViewOffersModel updatedOffer);

  Future<ResponseModel> addOffers(ViewOffersModel offers);

  Future<ResponseModel> addOrder(OrderModel order);

  Future<ResponseModel> updateOrder(OrderModel order, int id);

  Future<List<OrderModel>> getOrdersByDeliveryBuyer(int id);

  Future<List<OrderModel>> getOrdersByDeliverySeller(int id);

  Future<List<OrderLog>> getOrderLogsByOrderId(int id);

  //Green Zone
  Future<List<GreenZoneModel>> getAllArticles();

  Future<List<ViewProduct>> getFilteredProductsByCategory(
      String? category, int userId);

  Future<List<ViewProduct>> searchProducts(String query, int userId);

  Future<Uint8List?> getSellerProfileImage(String username);

  // Request password reset
  Future<ResponseModel> requestPasswordReset(String email);

  // Reset password
  Future<ResponseModel> resetPassword(String otp, String newPassword);

  //Verify Otp
  Future<ResponseModel> verifyOtp(String otp);
}
