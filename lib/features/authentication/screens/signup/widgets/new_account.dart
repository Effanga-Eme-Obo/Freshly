import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../verify_email.dart';
import 'mterms.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _passwordVisible = false;
  bool _confirmpasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              /// First + Last Names
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: Mtexts.firstName,
                      prefixIcon: Icon(Iconsax.user)
                  ),
                ),
              ),
              SizedBox(width: MSizes.spaceBtwnInputFields),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: Mtexts.lastName,
                      prefixIcon: Icon(Iconsax.user)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MSizes.spaceBtwnInputFields),

          // Email
          TextFormField(
            decoration: InputDecoration(
                labelText: Mtexts.email,
                prefixIcon: Icon(Iconsax.direct)
            ),
          ),
          SizedBox(height: MSizes.spaceBtwnInputFields),

          /// Phone Number
          TextFormField(
            decoration: InputDecoration(
                labelText: Mtexts.phoneNo,
                prefixIcon: Icon(Iconsax.call)
            ),
          ),
          SizedBox(height: MSizes.spaceBtwnInputFields),

          /// Password + Confirm Password
          TextFormField(
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
                labelText: Mtexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: Icon(_passwordVisible ? Iconsax.eye : Iconsax.eye_slash),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )
            ),
          ),
          SizedBox(height: MSizes.spaceBtwnInputFields),
          TextFormField(
            obscureText: !_confirmpasswordVisible,
            decoration: InputDecoration(
                labelText: "Confirm Password",
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: Icon(_confirmpasswordVisible ? Iconsax.eye : Iconsax.eye_slash),
                  onPressed: () {
                    setState(() {
                      _confirmpasswordVisible = !_confirmpasswordVisible;
                    });
                  },
                )
            ),
          ),
          SizedBox(height: MSizes.spaceBtwnInputFields),

          /// T's & C's
          const Mterms(),
          const SizedBox(height: MSizes.spaceBtwnSections),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text(Mtexts.createAccount),
            ),
          ),

        ],
      ),
    );
  }
}
