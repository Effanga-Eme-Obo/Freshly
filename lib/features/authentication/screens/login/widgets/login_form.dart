import 'package:freshly/features/authentication/screens/password_config/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../nav_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class MLoginForm extends StatelessWidget {
  const MLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: MSizes.spaceBtwnSections),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: Mtexts.email,
              ),
            ),
            SizedBox(height: MSizes.spaceBtwnInputFields),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: Mtexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //Checkbox(value: true, onChanged: (value) {}),
                    //const Text(Mtexts.rememberMe),
                  ],
                ),
              ],
            ),
            const SizedBox(height: MSizes.spaceBtwnSections),

            /// Log in Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => NavMenu()), child: Text(Mtexts.signIn, style: TextStyle(fontFamily: 'DM Sans', fontSize: 20)))),
            const SizedBox(height: 5),

            /// Forgot Password?
            TextButton(
                onPressed: () => Get.to(() => ForgotPassword()),
                child: Text(Mtexts.forgotPassword, style: TextStyle(fontFamily: 'DM Sans', fontSize: 15, color: dark? MColors.primaryColor : Colors.black))),
            const SizedBox(height: MSizes.spaceBtwnItems),
          ],
        ),
      ),
    );
  }
}