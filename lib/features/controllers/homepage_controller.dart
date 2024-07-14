import 'package:get/get.dart';

class HomepageController extends GetxController{
  static HomepageController get instance => Get.find();

  final carouselCurrentIndex = 0.obs;

  void updatePageIndicator(index){
    carouselCurrentIndex.value = index;
  }
}