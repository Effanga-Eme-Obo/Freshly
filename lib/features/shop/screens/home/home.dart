import 'package:flutter/cupertino.dart';
import 'package:freshly/common/widgets/appbar/appbar.dart';
import 'package:freshly/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:freshly/features/shop/screens/upload/add_produce.dart';
import 'package:freshly/features/shop/screens/upload/upload.dart';
import 'package:freshly/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  final String imageUrl;
  const HomeScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 450,
              //color: MColors.primaryColor,
              decoration: const BoxDecoration(
                //borderRadius: BorderRadius.circular(30),
                color: MColors.primaryColor,
              ),
            ),
          ),
          Positioned(
              top: -150,
              right: -200,
              child: MCircularContainer(
                  bgColor: MColors.textWhite.withOpacity(0.1))),
          Positioned(
              top: 100,
              right: -300,
              child: MCircularContainer(
                  bgColor: MColors.textWhite.withOpacity(0.1))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MAppBar(),
              //const SizedBox(height: MSizes.spaceBtwnSections),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 8.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/upload/profile_again.png'),
                ),
              ),
              SizedBox(height: 9.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text('Hello, Ayoola Favour👋🏾', style: TextStyle(fontFamily: 'DM Sans', fontSize: 27, fontWeight: FontWeight.w700, color: MColors.textWhite)),
              ),
              //SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text('What are we selling today?', style: TextStyle(color: MColors.textWhite, fontSize: 15.5)),
              )
            ],
          ),
          Positioned(
            top: 320,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: dark ? MColors.dark : MColors.white,
              ),
              child: imageUrl.isNotEmpty
                ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, top: MSizes.defaultSpace - 10),
                      child: Text('Your Produce', style: TextStyle(fontFamily: 'DM Sans', fontSize: 20, color: dark ? MColors.textWhite : MColors.dark)),
                    ),
                    SizedBox(height: MSizes.spaceBtwnSections),
                    SizedBox(
                      height: 200, width: 200,
                        child: Image.network(imageUrl),
                    ),
                  ],
                )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25, top: MSizes.defaultSpace - 10),
                        child: Text('Your Produce', style: TextStyle(fontFamily: 'DM Sans', fontSize: 20, color: dark ? MColors.textWhite : MColors.dark)),
                      ),
                      Center(
                        child: IconButton(
                          padding: const EdgeInsets.only(top: 180),
                          onPressed: () => Get.to(() => const AddProduce()),
                          icon: const Icon(
                            Iconsax.add_circle,
                            size: 70,
                          ),
                        color: MColors.accentColor,
                       ),
                      ),
                      SizedBox(height: 2.0),
                      Center(
                        child: Text('Add produce to get', style: TextStyle(fontFamily: 'DM Sans', fontSize: 16, color: dark ? MColors.textWhite.withOpacity(0.7) : MColors.dark.withOpacity(0.7))),
                      ),
                      Center(
                        child: Text('started', style: TextStyle(fontFamily: 'DM Sans', fontSize: 16, color: dark ? MColors.textWhite.withOpacity(0.7) : MColors.dark.withOpacity(0.7))),
                      ),
                                    ],
                                  ),
            ),
          ),
        ],
      ),
    );
  }
}

