import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshly/common/widgets/appbar/appbar.dart';
import 'package:freshly/features/authentication/screens/login/login.dart';
import 'package:freshly/features/shop/screens/settings/change_password.dart';
import 'package:freshly/features/shop/screens/settings/edit_profile.dart';
import 'package:freshly/features/shop/screens/settings/widgets/toggle_switch.dart';
import 'package:freshly/resources/auth_services.dart';
import 'package:freshly/utils/constants/colors.dart';
import 'package:freshly/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.lightGrey,
      appBar: const MAppBar(
        showBackArrow: false,
        title: Center(
          child: Text('My Profile', style: TextStyle(fontFamily: 'DM Serif', fontSize: 30, fontWeight: FontWeight.normal)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: MSizes.spaceBtwnSections),
            /// Profile
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 8.0),
              child: Text('PROFILE'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Container(
                decoration: BoxDecoration(
                  color: MColors.textWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/upload/profile_again.png'),
                        radius: 50,
                        ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${user?.displayName}', style: const TextStyle(fontSize: 24, color: MColors.accentColor)),
                        const Text('Ikenne, Ogun State', style: TextStyle(fontSize: 16)),
                        TextButton(onPressed: () => Get.to(() => const EditProfile()), child: const Text('Edit Profile', style: TextStyle(fontSize: 20, color: MColors.textSecondary, decoration: TextDecoration.underline, decorationColor: MColors.textSecondary)))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwnSections),

            /// Settings
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 8.0),
              child: Text('SETTINGS'),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Expanded(
                child: Container(              
                  decoration: BoxDecoration(
                    color: MColors.textWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// Change Password
                      TextButton(
                        onPressed: () => Get.to(() => const ChangePassword()),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(MColors.black),
                          ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.lock_outline),
                              SizedBox(width: MSizes.spaceBtwnItems),
                              Text('Change Password', style: TextStyle(fontSize: 20)),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: MSizes.spaceBtwnInputFields),

                      /// Dark Mode
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 13.0),
                              child: Icon(Iconsax.moon),
                            ),
                            SizedBox(width: MSizes.spaceBtwnItems),
                            Text('Dark Mode', style: TextStyle(fontSize: 20)),
                            Spacer(),
                            DarkModeSwitch(),
                          ],
                        ),
                      ),
                      const SizedBox(height: MSizes.spaceBtwnInputFields),

                      /// Contact Us
                      TextButton(
                        onPressed: (){}, 
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(MColors.black),
                          ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: [
                              Icon(Icons.headset_mic_outlined),
                              SizedBox(width: MSizes.spaceBtwnItems),
                              Text('Contact us', style: TextStyle(fontSize: 20)),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: MSizes.spaceBtwnInputFields),

                      /// About
                      TextButton(
                        onPressed: (){}, 
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(MColors.black),
                          ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10.0, bottom: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.help_outline),
                              SizedBox(width: MSizes.spaceBtwnItems),
                              Text('About', style: TextStyle(fontSize: 20)),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwnSections),
            
            ///Account
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 8.0),
              child: Text('ACCOUNT'),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Container(
                decoration: BoxDecoration(
                  color: MColors.textWhite,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    /// Log Out
                      TextButton(
                        onPressed: (){
                          Alert(
                          context: context,
                          type: AlertType.warning,
                          title: 'WARNING',
                          desc: 'Are you trying to log out?',
                          buttons: [
                            DialogButton(
                              onPressed: () => Navigator.pop(context),
                              color: MColors.success,
                              child: const Text('No', style: TextStyle(fontFamily: 'DM Sans', fontSize: 20)),
                              ),
                            DialogButton(
                              onPressed: () {
                                AuthService().signOut();
                                Get.to(() => const LoginScreen());
                              },
                              color: MColors.error,
                              child: const Text('Log Out', style: TextStyle(fontFamily: 'DM Sans', fontSize: 20),),
                              ),
                          ],
                        ).show();  
                        }, 
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(MColors.black),
                          ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Row(
                            children: [
                              Icon(Iconsax.logout),
                              SizedBox(width: MSizes.spaceBtwnItems),
                              Text('Log Out', style: TextStyle(fontSize: 20)),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: MSizes.spaceBtwnInputFields),

                      /// Delete Account
                      TextButton(
                        onPressed: (){
                        Alert(
                          context: context,
                          //style: AlertStyle(backgroundColor: MColors.textWhite),
                          type: AlertType.warning,
                          title: 'WARNING',
                          desc: 'Are you sure you want to delete your account?',
                          buttons: [
                            DialogButton(
                              onPressed: () => Navigator.pop(context),
                              color: MColors.success,
                              child: const Text('No', style: TextStyle(fontFamily: 'DM Sans', fontSize: 20)),
                              ),
                            DialogButton(
                              onPressed: (){
                                Alert(
                                  context: context,
                                  type: AlertType.success,
                                  title: 'ACCOUNT DELETED',
                                  desc: 'You have successfully deleted your account',
                                  buttons: [
                                    DialogButton(
                                      child: const Text('OK'),
                                      onPressed: () => Get.to(() => const LoginScreen()),
                                    ),
                                  ]
                                ).show();
                              },
                              color: MColors.error,
                              child: const Text('Delete', style: TextStyle(fontFamily: 'DM Sans', fontSize: 20),),
                              ),
                          ],
                        ).show();  
                        }, 
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(MColors.black),
                          ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10.0, bottom: 8.0),
                          child: Row(              
                            children: [
                              Icon(Iconsax.trash, color: MColors.error,),
                              SizedBox(width: MSizes.spaceBtwnItems),
                              Text('Delete Account', style: TextStyle(fontSize: 20, color: MColors.error)),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}