import 'package:flutter/widgets.dart';
import 'package:freshly/common/widgets/login_signup/form_divider.dart';
import 'package:freshly/common/widgets/login_signup/social_buttons.dart';
import 'package:freshly/features/authentication/screens/signup/widgets/new_account.dart';
import 'package:freshly/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(Mtexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: MSizes.spaceBtwnSections),

              /// Form
              //const MSignupForm(),
              CreateAccount(),
              const SizedBox(height: MSizes.spaceBtwnItems),
              
              /// Divider
              MFormDivider(dividerText: Mtexts.signUpWith.capitalize!),
              const SizedBox(height: MSizes.spaceBtwnItems),

              /// Social Buttons
              const MSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}


