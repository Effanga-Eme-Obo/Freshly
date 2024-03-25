import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../verify_email.dart';
import 'mterms.dart';
import '../../../../../resources/auth_services.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _passwordVisible = false;
  bool _confirmpasswordVisible = false;

  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
                  controller: _fnameController,
                  decoration: InputDecoration(
                      labelText: Mtexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              SizedBox(width: MSizes.spaceBtwnInputFields),
              Expanded(
                child: TextFormField(
                  controller: _lnameController,
                  decoration: InputDecoration(
                      labelText: Mtexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          SizedBox(height: MSizes.spaceBtwnInputFields),

          // Email
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
                labelText: Mtexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          SizedBox(height: MSizes.spaceBtwnInputFields),

          /// Phone Number
          TextFormField(
            controller: _phoneNoController,
            decoration: InputDecoration(
              labelText: Mtexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: MSizes.spaceBtwnInputFields),

          /// Password + Confirm Password
          TextFormField(
            controller: _passwordController,
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
                labelText: Mtexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon:
                      Icon(_passwordVisible ? Iconsax.eye : Iconsax.eye_slash),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )),
          ),
          SizedBox(height: MSizes.spaceBtwnInputFields),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: !_confirmpasswordVisible,
            decoration: InputDecoration(
                labelText: "Confirm Password",
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: Icon(_confirmpasswordVisible
                      ? Iconsax.eye
                      : Iconsax.eye_slash),
                  onPressed: () {
                    setState(() {
                      _confirmpasswordVisible = !_confirmpasswordVisible;
                    });
                  },
                )),
          ),
          SizedBox(height: MSizes.spaceBtwnInputFields),

          /// T's & C's
          const Mterms(),
          const SizedBox(height: MSizes.spaceBtwnSections),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final message = await AuthService().registration(
                  firstName: _fnameController.text,
                  lastName: _lnameController.text,
                  email: _emailController.text,
                  phoneNo: _phoneNoController.text,
                  password: _passwordController.text,
                );

                await AuthService().sendEmailVerification();

                if (message!.contains('Success')) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => VerifyEmailScreen()));
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              },
              child: const Text(Mtexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
