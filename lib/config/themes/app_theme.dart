import 'package:flutter/material.dart';
import 'package:social_media_app/core/utils/app_colors.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.bGColor,
      primaryColor: AppColors.primaryYalowColor,
      appBarTheme: AppBarTheme(
          elevation: 0,
          shadowColor: Colors.transparent,
          color: AppColors.bGColor,
          iconTheme: IconThemeData(color: AppColors.blackColor)));
}
