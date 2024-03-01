import 'package:freshly/features/shop/screens/home/widgets/home_appbar.dart';
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
  const HomeScreen({super.key});

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
              decoration: BoxDecoration(
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
          Container(
            child: Column(
              children: [
                MHomeAppbar(),
                SizedBox(height: MSizes.spaceBtwnSections),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
                  child: Container(
                    width: MDeviceUtils.getScreenWidth(context),
                    padding: EdgeInsets.all(MSizes.md),
                    decoration: BoxDecoration(
                      color: dark ? MColors.black : MColors.white,
                      borderRadius: BorderRadius.circular(MSizes.cardRadiusLg),
                      border: Border.all(color: MColors.grey),
                    ),
                    child: Row(
                      children: [
                        Icon(Iconsax.search_normal_1,
                            color: dark ? MColors.textWhite : MColors.dark),
                        SizedBox(width: MSizes.spaceBtwnItems),
                        Text('Search', style: TextStyle(fontFamily: 'DM Sans')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Positioned(
              left: 0,
              right: 0,
              top: 320,
              bottom: 0,
              child: Container(
                height: 250,
                //padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 450),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  color: dark ? MColors.dark : MColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, top: MSizes.defaultSpace - 10),
                      child: Text('Your Uploads', style: TextStyle(fontFamily: 'DM Sans', fontSize: 20, color: dark ? MColors.textWhite : MColors.dark)),
                    ),
                    Center(
                      child: IconButton(
                        padding: EdgeInsets.only(top: 180),
                          onPressed: () => Get.to(() => UploadProduce()),
                          icon: Icon(
                            Iconsax.add5,
                            size: 70,
                          ),
                        color: MColors.warning.withOpacity(0.4),
                      ),
                    ),
                    Center(
                      child: Text("You don't have any produce yet", style: TextStyle(fontFamily: 'DM Sans', fontSize: 16, color: dark ? MColors.textWhite.withOpacity(0.7) : MColors.dark.withOpacity(0.7))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

