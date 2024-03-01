import 'package:freshly/features/authentication/screens/onboarding/widgets/onboarding_dots_navigation.dart';
import 'package:freshly/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:freshly/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:freshly/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Onboarding Page 1
                  Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(MImages.onboardingImage1),
                        radius: 150.0,
                      ),
                    ),
                  ),
                  SizedBox(height: MSizes.spaceBtwnSections),
                  Text(Mtexts.onboardingTitle1, style: TextStyle(fontFamily: 'DM Serif', fontSize: 34, color: MColors.textPrimary, /*fontWeight: FontWeight.bold*/)),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(text: '${Mtexts.farm2App} ', style: TextStyle(fontFamily: 'DM Serif', fontSize: 34, color: MColors.textSecondary, /*fontWeight: FontWeight.bold*/)),
                      TextSpan(text: '${Mtexts.store} ', style: TextStyle(fontFamily: 'DM Serif', fontSize: 34, color: MColors.textPrimary, /*fontWeight: FontWeight.bold*/)),
                    ],
                  )),
                  SizedBox(height: MSizes.spaceBtwnSections),
                  //SizedBox(height: MSizes.spaceBtwnSections),
                  Container( alignment: Alignment.center, child: Text(Mtexts.onboardingSubTitle1)),
                  Container( alignment: Alignment.center, child: Text(Mtexts.onboardingSubTitle1b)),
                  ],
              ),

              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Onboarding Page 2
                  Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(MImages.onboardingImage2),
                        radius: 150.0,
                      ),
                    ),
                  ),
                  SizedBox(height: MSizes.spaceBtwnSections),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(text: '${Mtexts.onboardingTitle2} ', style: TextStyle(fontFamily: 'DM Serif', fontSize: 34, color: MColors.textPrimary, /*fontWeight: FontWeight.bold*/)),
                      TextSpan(text: '${Mtexts.your} ', style: TextStyle(fontFamily: 'DM Serif', fontSize: 34, color: MColors.textSecondary, /*fontWeight: FontWeight.bold*/)),
                    ],
                  )),
                  Text(Mtexts.reach, style: TextStyle(fontFamily: 'DM Serif', fontSize: 34, color: MColors.textSecondary, /*fontWeight: FontWeight.bold*/)),
                  SizedBox(height: MSizes.spaceBtwnSections),
                  //SizedBox(height: MSizes.spaceBtwnSections),
                  Container( alignment: Alignment.center, child: Text(Mtexts.onboardingSubTitle2)),
                  Container( alignment: Alignment.center, child: Text(Mtexts.onboardingSubTitle2b)),
                ],
              ),

              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Onboarding Page 3
                  Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(MImages.onboardingImage3),
                        radius: 150.0,
                      ),
                    ),
                  ),
                  SizedBox(height: MSizes.spaceBtwnSections),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(text: '${Mtexts.onboardingTitle3} ', style: TextStyle(fontFamily: 'DM Serif', fontSize: 34, color: MColors.textPrimary, /*fontWeight: FontWeight.bold*/)),
                      TextSpan(text: '${Mtexts.sales} ', style: TextStyle(fontFamily: 'DM Serif', fontSize: 34, color: MColors.textSecondary, /*fontWeight: FontWeight.bold*/)),
                    ],
                  )),
                  Text(Mtexts.mgmt, style: TextStyle(fontFamily: 'DM Serif', fontSize: 34, color: MColors.textSecondary, /*fontWeight: FontWeight.bold*/)),
                  SizedBox(height: MSizes.spaceBtwnSections),
                  //SizedBox(height: MSizes.spaceBtwnSections),
                  Container( alignment: Alignment.center, child: Text(Mtexts.onboardingSubTitle3)),
                  Container( alignment: Alignment.center, child: Text(Mtexts.onboardingSubTitle3b)),
                ],
              ),
            ],
          ),

          /// Skip Button

          const OnboardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnboardingDotNavigation(),

          /// Circular Button
          OnboardingNextButton(),
        ],
      ),
    );
  }
}


