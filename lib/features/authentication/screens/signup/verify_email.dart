import 'package:freshly/common/widgets/success_screen/success_screen.dart';
import 'package:freshly/features/authentication/screens/login/login.dart';
import 'package:freshly/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => LoginScreen()), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image: AssetImage(MImages.deliveredEmailIllustration), width: MHelperFunctions.screenWidth() * 0.6),
              SizedBox(height: MSizes.spaceBtwnSections),

              /// Title & Subtitle
              Text(Mtexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              SizedBox(height: MSizes.spaceBtwnItems),
              Text('emeoboeffanga@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              SizedBox(height: MSizes.spaceBtwnItems),
              Text(Mtexts.confirmEmailSubtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              SizedBox(height: MSizes.spaceBtwnSections),

              /// Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => SuccessScreen(onPressed: () => Get.to(() => LoginScreen()), image: MImages.staticSuccessIllustration, title: Mtexts.yourAccountCreatedTitle, subTitle: Mtexts.yourAccountCreatedSubTitle, )), child: Text(Mtexts.mContinue))),
              SizedBox(height: MSizes.spaceBtwnItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: Text(Mtexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
