import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/circle_container.dart';
import '../../../../common/rounded_image.dart';
import '../../../../constants/sizes.dart';
import '../../../controllers/homepage_controller.dart';


class ReGainCarousel extends StatelessWidget {
  const ReGainCarousel({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomepageController());
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, _) => controller.updatePageIndicator(index)
                ),
                items: banners.map((url) => ReGainRoundedImage(imageUrl: url)).toList()
            ),
            Positioned(
              bottom: 8.0,  // Adjust this value as needed
              left: 0,
              right: 0,
              child: Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i = 0; i < banners.length; i++)
                      ReGainCircularContainer(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 4),
                        backgroundColor: controller.carouselCurrentIndex.value == i ? Colors.black : Colors.grey,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: ReGainSizes.spaceBtwItems),
      ],
    );
  }
}

