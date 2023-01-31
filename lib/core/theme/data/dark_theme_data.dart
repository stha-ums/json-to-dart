import 'package:flutter/material.dart';
import 'package:json_to_dart/config/constants/colors/colors.dart';

class DarkTheme {
  ThemeData call() {
    return ThemeData.dark().copyWith(
      primaryColor: const Color(0xff357EC7),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Color(0xff357EC7),
      ),
      scaffoldBackgroundColor: AppColors.sacaffoldColorDark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xff357EC7),
        secondary: Color(0xffC0C0C0),
      ),
    );
  }
}
