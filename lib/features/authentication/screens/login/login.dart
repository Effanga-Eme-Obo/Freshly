import 'package:freshly/common/styles/spacing_styles.dart';
import 'package:freshly/features/authentication/screens/login/widgets/login_form.dart';
import 'package:freshly/features/authentication/screens/login/widgets/login_header.dart';
import 'package:freshly/features/authentication/screens/signup/signup.dart';
import 'package:freshly/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants//sizes.dart';
import '../../../../utils/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Logo, Title, Subtitle
              MLoginHeader(),

              /// Form
              MLoginForm(),

              ///Divider
              MFormDivider(dividerText: 'Or'),

              SizedBox(height: MSizes.spaceBtwnSections),

              ///Footer
              MSocialButtons(),

              SizedBox(height: MSizes.spaceBtwnInputFields),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: TextStyle(fontFamily: 'DM Sans', fontSize: 14, color: dark? MColors.white : Colors.black, fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () => Get.to(() => SignupScreen()),
                      child: Text('Sign up', style: TextStyle(fontFamily: 'DM Sans', fontSize: 15, color: dark? MColors.textSecondary : MColors.primaryColor))),
                  const SizedBox(height: MSizes.spaceBtwnItems),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




