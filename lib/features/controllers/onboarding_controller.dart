import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/login/login.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }
  void nextPage(){
    if(currentPageIndex.value == 3){
      Get.to(LoginScreen());
    } else{
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage(){
    Get.to(LoginScreen());
  }
}