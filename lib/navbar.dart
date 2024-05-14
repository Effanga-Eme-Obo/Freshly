import 'package:flutter/material.dart';
import 'package:freshly/features/shop/screens/chat/messages.dart';
import 'package:freshly/features/shop/screens/home/home.dart';
import 'package:freshly/features/shop/screens/search/search.dart';
import 'package:freshly/features/shop/screens/settings/settings.dart';
import 'package:freshly/features/shop/screens/upload/add_produce.dart';
import 'package:freshly/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final List _screens = [
    HomeScreen(imageUrl: ''),
    const SearchProduce(),
    const AddProduce(),
    const ChatScreen(),
    SettingsScreen(),
  ];

  void _updateSelectedBottomNavIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _updateSelectedBottomNavIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: MColors.white,
        unselectedItemColor: MColors.primaryColor,
        selectedItemColor: MColors.primaryColor,
        items: [
          _buildBottomNavBarItem(
            activeIcon: Iconsax.home_25,
            inactiveIcon: Iconsax.home_2,
            label: 'Home',
            index: 0,
          ),
          _buildBottomNavBarItem(
            activeIcon: Iconsax.search_normal_1,
            inactiveIcon: Iconsax.search_normal_1,
            label: 'Search',
            index: 1,
          ),
          _buildBottomNavBarItem(
            activeIcon: Iconsax.add_circle5,
            inactiveIcon: Iconsax.add_circle,
            label: '',
            index: 2,
            size: 55,
          ),
          _buildBottomNavBarItem(
            activeIcon: Iconsax.message5,
            inactiveIcon: Iconsax.message,
            label: 'Message',
            index: 3,
          ),
          _buildBottomNavBarItem(
            activeIcon: Iconsax.profile_circle5,
            inactiveIcon: Iconsax.profile_circle,
            label: 'Profile',
            index: 4,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavBarItem(
      {double? size,
      required IconData activeIcon,
      required IconData inactiveIcon,
      required String label,
      required int index}) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: MColors.white,
        ),
        child: Icon(
          (_selectedIndex == index) ? activeIcon : inactiveIcon,
          size: size ?? 30,
        ),
      ),
      label: label,
    );
  }
}
