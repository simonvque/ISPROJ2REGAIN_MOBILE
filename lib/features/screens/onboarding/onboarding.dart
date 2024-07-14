import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regain_mobile/features/screens/onboarding/widgets/onboarding_navigation.dart';
import 'package:regain_mobile/features/screens/onboarding/widgets/onboarding_next.dart';
import 'package:regain_mobile/features/screens/onboarding/widgets/onboarding_page.dart';
import 'package:regain_mobile/features/screens/onboarding/widgets/onboarding_skip.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../../controllers/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget{
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context){
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(image: ReGainImages.onboardingImage1, title: ReGainTexts.onboardingTitle1, subTitle: ReGainTexts.onboardingSubtitle1,),
              OnboardingPage(image: ReGainImages.onboardingImage2, title: ReGainTexts.onboardingTitle2, subTitle: ReGainTexts.onboardingSubtitle2,),
              OnboardingPage(image: ReGainImages.onboardingImage3, title: ReGainTexts.onboardingTitle3, subTitle: ReGainTexts.onboardingSubtitle3,),
              OnboardingPage(image: ReGainImages.onboardingImage4, title: ReGainTexts.onboardingTitle4, subTitle: ReGainTexts.onboardingSubtitle4,),
            ],
          ),
          const OnboardingSkip(),
          const OnboardingNavigation(),
          const OnboardingNext(),
        ],
      ),
    );
  }
}






