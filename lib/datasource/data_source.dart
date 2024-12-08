import 'package:regain_mobile/model/address_model.dart';
import 'package:regain_mobile/model/category.dart';
import 'package:regain_mobile/model/favorite_model.dart';
import 'package:regain_mobile/model/green_zone_model.dart';
import 'package:regain_mobile/model/order_model.dart';
import 'package:regain_mobile/model/product_listing.dart';
import 'package:regain_mobile/model/response_model.dart';
import 'package:regain_mobile/model/user_id_model.dart';
import 'package:regain_mobile/model/user_model.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/model/viewoffers_model.dart';

abstract class DataSource {
  Future<ResponseModel> addUser(UserModel user);

  Future<ResponseModel> addUserID(UserIDModel userID);

  Future<ResponseModel> updateUser(UserModel user);

  // Future<UserModel?> getUserById(int id);

  Future<ResponseModel> login(UserModel user);

  Future<ResponseModel> addAddress(AddressModel address);

  Future<List<AddressModel>> getAddressesByUser(int id);

  Future<ResponseModel> deleteAddress(int id);

  Future<ResponseModel> addProduct(Product product);

  Future<ResponseModel> updateProduct(int id, Product product);

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

  Future<List<OrderModel>> getOrdersByDeliveryBuyer(String method, int id);

  Future<List<OrderModel>> getOrdersByDeliverySeller(String method, int id);
  //Green Zone
  Future<List<GreenZoneModel>> getAllArticles();

  // Request password reset
  Future<ResponseModel> requestPasswordReset(String email);

  // Reset password 
  Future<ResponseModel> resetPassword(String otp, String newPassword);

  //Verify Otp
  Future<ResponseModel> verifyOtp(String otp);
}
