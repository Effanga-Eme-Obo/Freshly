import 'package:flutter/material.dart';
import 'package:freshly/common/widgets/appbar/appbar.dart';
import 'package:freshly/utils/constants/colors.dart';
import 'package:freshly/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        showBackArrow: false,
        title: Center(child: Text('My Profile', style: TextStyle(fontFamily: 'DM Serif', fontSize: 18),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
              child: Text('PROFILE'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Container(
                decoration: BoxDecoration(
                  color: MColors.lightGrey,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircleAvatar(
                        backgroundColor: MColors.textSecondary,
                        radius: 50,
                        ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ayoola Favour', style: TextStyle(fontSize: 24, color: MColors.accentColor)),
                        Text('Ikenne, Ogun State', style: TextStyle(fontSize: 16)),
                        TextButton(onPressed: (){}, child: Text('Edit Profile', style: TextStyle(fontSize: 20, color: MColors.textSecondary, decoration: TextDecoration.underline,)))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MSizes.spaceBtwnSections),

            /// Settings
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
              child: Text('SETTINGS'),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Expanded(
                child: Container(
                  //height: 233, width: 322,
                  decoration: BoxDecoration(
                    color: MColors.lightGrey,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// Change Password
                      OutlinedButton(
                        onPressed: (){}, 
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(MColors.lightGrey),
                          foregroundColor: MaterialStateProperty.all(MColors.black),
                          ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: [
                              Icon(Icons.lock_outline),
                              SizedBox(width: MSizes.spaceBtwnItems),
                              Text('Change Password'),
                              SizedBox(width: 132),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),

                      /// Change Password
                      OutlinedButton(
                        onPressed: (){}, 
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(MColors.lightGrey),
                          foregroundColor: MaterialStateProperty.all(MColors.black),
                          ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: [
                              Icon(Iconsax.moon),
                              SizedBox(width: MSizes.spaceBtwnItems),
                              Text('Dark Mode'),
                              SizedBox(width: 182),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}