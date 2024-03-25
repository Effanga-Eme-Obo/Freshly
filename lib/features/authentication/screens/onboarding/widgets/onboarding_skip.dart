import 'package:flutter/material.dart';
import 'package:freshly/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants//sizes.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Positioned(
        left: MSizes.defaultSpace,
        bottom: MDeviceUtils.getBottomNavigationBarHeight(),
        child: TextButton(
          onPressed: () => Get.to(() => LoginScreen()),
          child: Text('Skip', style: TextStyle(fontFamily: 'DM Sans', fontWeight: FontWeight.bold, fontSize: 19, color: dark? MColors.primaryColor : Colors.black)),
        ));
  }
}