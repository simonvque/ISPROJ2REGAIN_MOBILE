import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/homepage/homepage.dart';
import 'package:regain_mobile/features/screens/homepage/selected_item.dart';
import 'package:regain_mobile/features/screens/listings/add.dart';
import 'package:regain_mobile/features/screens/listings/add_equipment.dart';
import 'package:regain_mobile/features/screens/listings/add_product.dart';
import 'package:regain_mobile/features/screens/listings/user_products_screen.dart';
import 'package:regain_mobile/features/screens/login/login.dart';
import 'package:regain_mobile/features/screens/onboarding/onboarding.dart';
import 'package:regain_mobile/features/screens/onboarding/widgets/onboarding_navigation.dart';
import 'package:regain_mobile/features/screens/orders/my_orders_page.dart';
import 'package:regain_mobile/features/screens/profile/edit_profile_page.dart';
import 'package:regain_mobile/features/screens/profile/profile_page.dart';
import 'package:regain_mobile/features/screens/registration/registration.dart';
import 'package:regain_mobile/nav.dart';

class RouteManager {
  //Route Texts
  static const String routeNotFound = "Error: route not found";

  static const String routeOnboarding = "Onboarding";
  static const String routeLogin = "LoginScreen";
  static const String routeRegistration = "RegistrationScreen";
  static const String routeHomepage = "HomepageScreen";
  static const String routeNavMenu = "NavigationMenu";
  static const String routeProfilePage = "ProfilePage";
  static const String routeEditProfile = "EditProfilePage";
  static const String routeAdd = "Add";
  static const String routeAddProduct = "AddProduct";
  static const String routeUserProducts = "UserProducts";
  static const String routeAddEquipment = "AddEquipment";
  static const String routeOrderTracking = "OrderTracking";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeOnboarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case routeLogin:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case routeRegistration:
        return MaterialPageRoute(
            builder: (context) => const RegistrationScreen());
      case routeHomepage:
        return MaterialPageRoute(builder: (context) => const HomepageScreen());
      case routeNavMenu:
        return MaterialPageRoute(builder: (context) => const NavigationMenu());
      case routeProfilePage:
        return MaterialPageRoute(builder: (context) => const ProfilePage());
      case routeEditProfile:
        return MaterialPageRoute(builder: (context) => const EditProfilePage());
      case routeAdd:
        return MaterialPageRoute(builder: (context) => const Add());
      case routeAddProduct:
        return MaterialPageRoute(builder: (context) => const AddProduct());
      case routeUserProducts:
        return MaterialPageRoute(
            builder: (context) => const UserProductsScreen());
      case routeAddEquipment:
        return MaterialPageRoute(builder: (context) => const AddEquipment());
      case routeOrderTracking:
        return MaterialPageRoute(builder: (context) => OrderTrackingPage());
      default:
        throw const FormatException(routeNotFound);
    }
  }
}
