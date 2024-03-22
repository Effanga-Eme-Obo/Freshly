import 'package:flutter/widgets.dart';
import 'package:freshly/features/authentication/screens/password_config/forgot_password.dart';
import 'package:freshly/features/authentication/screens/password_config/reset_password.dart';
import 'package:freshly/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../authentication/screens/login/login.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _passwordVisible = false;
  bool _newpasswordVisible = false;
  bool _confirmnewpasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Headings
              Text('Change Password', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: MSizes.spaceBtwnItems),
              Text('To set a new password, kindly enter your current password', style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: MSizes.spaceBtwnSections * 2),
            
              /// Current Password
              TextFormField(
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                    labelText: 'Current Password',
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

              /// New + Confirm Password
              TextFormField(
                obscureText: !_newpasswordVisible,
                decoration: InputDecoration(
                    labelText: 'New Password',
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      icon: Icon(_newpasswordVisible ? Iconsax.eye : Iconsax.eye_slash),
                      onPressed: () {
                        setState(() {
                          _newpasswordVisible = !_newpasswordVisible;
                        });
                      },
                    )
                ),
              ),
              SizedBox(height: MSizes.spaceBtwnInputFields),
              TextFormField(
                obscureText: !_confirmnewpasswordVisible,
                decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      icon: Icon(_confirmnewpasswordVisible ? Iconsax.eye : Iconsax.eye_slash),
                      onPressed: () {
                        setState(() {
                          _confirmnewpasswordVisible = !_confirmnewpasswordVisible;
                        });
                      },
                    )
                ),
              ),
            
              /// Forgot Password
              Positioned(
                right: double.infinity,
                child: TextButton(
                  onPressed: () => Get.to(() => ForgotPassword()),
                  child: Text('Forgot Password?', style: TextStyle(color: MColors.textSecondary)),
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwnSections),
            
              /// Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Alert(
                        context: context,
                        type: AlertType.success,
                        title: 'SUCCESS!',
                        desc: 'Your password has been reset',
                        buttons: [
                          DialogButton(
                            color: MColors.borderPrimary,
                            child: const Text('OK'),
                            onPressed: () => Get.to(() => const LoginScreen()),
                          ),
                        ]
                    ).show();
                  },
                  child: const Text('Done'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

