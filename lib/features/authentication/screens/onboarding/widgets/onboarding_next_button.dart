import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Positioned(
      right: MSizes.defaultSpace,
      bottom: MDeviceUtils.getBottomNavigationBarHeight(),
      child: SizedBox(
        width: 110,
        height: 56,
        child: ElevatedButton(
          onPressed: () => OnboardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(backgroundColor: dark? MColors.primaryColor : MColors.textSecondary),
          child: const Text('Next', style: TextStyle(fontFamily: 'DM Sans', /*fontWeight: FontWeight.bold,*/ fontSize: 19)),
        ),
      ),
    );
  }
}