import 'package:freshly/features/shop/screens/upload/upload.dart';
import 'package:freshly/utils/constants/colors.dart';
import 'package:freshly/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/shop/screens/home/home.dart';



class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavController());
    final darkMode = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
          height: 80, elevation: 0, selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? MColors.black : Colors.white,
          indicatorColor: darkMode ? MColors.textSecondary.withOpacity(0.1) : MColors.textSecondary.withOpacity(0.1),
          destinations: [
            NavigationDestination(icon: controller.selectedIndex.value == 0
                ? Icon(Iconsax.home_25, color: darkMode ? MColors.primaryColor : MColors.primaryColor, size: 30,) // Selected icon
                : Icon(Iconsax.home_2, color: MColors.primaryColor, size: 30,),label: ''),
            NavigationDestination(icon: Icon(Iconsax.search_normal_1, size: 30, color: MColors.primaryColor,), label: ''),
            NavigationDestination(icon: controller.selectedIndex.value == 2
                ? Icon(Iconsax.add5, color: darkMode ? MColors.primaryColor : MColors.primaryColor, size: 55,) // Selected icon
                : Icon(Iconsax.add_square, color: MColors.primaryColor, size: 55),label: ''),
            NavigationDestination(icon: controller.selectedIndex.value == 3
                ? Icon(Iconsax.message5, color: darkMode ? MColors.primaryColor : MColors.primaryColor, size: 30,) // Selected icon
                : Icon(Iconsax.message, color: MColors.primaryColor, size: 30,),label: ''),
            NavigationDestination(icon: controller.selectedIndex.value == 4
                ? Icon(Iconsax.profile_circle5, color: darkMode ? MColors.primaryColor : MColors.primaryColor, size: 30,) // Selected icon
                : Icon(Iconsax.profile_circle, color: MColors.primaryColor, size: 30,),label: ''),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomeScreen(), Container(color: Colors.purple), const UploadProduce(), Container(color: Colors.blue), Container(color: Colors.pink)];
}
