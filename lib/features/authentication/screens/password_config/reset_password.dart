import 'package:freshly/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.to(() => LoginScreen()), icon: const Icon(CupertinoIcons.clear))
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
              Text(Mtexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              SizedBox(height: MSizes.spaceBtwnItems),
              Text(Mtexts.changeYourPasswordSubtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              SizedBox(height: MSizes.spaceBtwnSections),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => Get.to(() => LoginScreen()), child: Text(Mtexts.done))),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(onPressed: (){}, child: Text(Mtexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
