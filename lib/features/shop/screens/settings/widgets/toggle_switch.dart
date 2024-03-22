import 'package:flutter/material.dart';
import 'package:freshly/utils/constants/colors.dart';

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({super.key});

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Switch(
        value: isDarkMode,
        onChanged: (value){
          setState(() {
            //isDarkMode = true;
          });
        },
        //inactiveThumbColor: MColors.accentColor,
        activeColor: MColors.borderPrimary,
      ),
    );
  }
}