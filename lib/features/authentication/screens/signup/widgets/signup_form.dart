import 'package:freshly/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'mterms.dart';

import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';


class MSignupForm extends StatelessWidget {
  const MSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// First & Last Names
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: Mtexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: MSizes.spaceBtwnInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: Mtexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: MSizes.spaceBtwnInputFields),

          /// Username
          /*TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: Mtexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: MSizes.spaceBtwnInputFields),*/

          /// Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: Mtexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: MSizes.spaceBtwnInputFields),

          /// Phone Number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: Mtexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: MSizes.spaceBtwnInputFields),

          /// Password
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: Mtexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwnInputFields),

          /// T's & C's
          Mterms(),
          const SizedBox(height: MSizes.spaceBtwnSections),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => VerifyEmailScreen()),
              child: const Text(Mtexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
