import 'package:freshly/features/authentication/screens/password_config/reset_password.dart';
import 'package:freshly/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/text_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(Mtexts.forgotPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: MSizes.spaceBtwnItems),
            Text(Mtexts.forgotPasswordSubtitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: MSizes.spaceBtwnSections * 2),

            /// Text field
            TextFormField(
              decoration: const InputDecoration(labelText: Mtexts.email, prefixIcon: Icon(Iconsax.direct_right)),
            ),
        const SizedBox(height: MSizes.spaceBtwnSections),

            /// Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const ResetPassword()), child: const Text(Mtexts.submit))),
          ],
        ),
      ),
    );
  }
}
