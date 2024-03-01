import 'package:freshly/utils/theme/custom_theme/appbar_theme.dart';
import 'package:freshly/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:freshly/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:freshly/utils/theme/custom_theme/chip_theme.dart';
import 'package:freshly/utils/theme/custom_theme/outlined_theme.dart';
import 'package:freshly/utils/theme/custom_theme/text_theme.dart';
import 'package:freshly/utils/theme/custom_theme/textform_field.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'custom_theme/elevated_theme.dart';

class MelonAppTheme{
  MelonAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'DM Sans',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MTextTheme.lightTextTheme,
    chipTheme: MChipTheme.lightChipTheme,
    appBarTheme: MAppbarTheme.lightAppBarTheme,
    checkboxTheme: MCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: MBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: MElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MOutlineButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'DM Sans',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: MColors.dark,
    textTheme: MTextTheme.darkTextTheme,
    chipTheme: MChipTheme.darkChipTheme,
    appBarTheme: MAppbarTheme.darkAppBarTheme,
    checkboxTheme: MCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: MBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: MElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MOutlineButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MTextFormFieldTheme.darkInputDecorationTheme,

  );
}