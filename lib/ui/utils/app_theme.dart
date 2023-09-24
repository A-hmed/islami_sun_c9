import 'package:flutter/material.dart';
import 'package:islami_sun_c9/ui/utils/app_colors.dart';

abstract class AppTheme{
  static const TextStyle appBarTitleTextStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
   color: AppColors.accent);
  static const TextStyle quranTabTitleTextStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.w600,
      color: AppColors.accent);
  static const TextStyle settingsTabTitle = TextStyle(fontSize: 25, fontWeight: FontWeight.w600,
      color: AppColors.accent);
  static const TextStyle settingsOptionTitle = TextStyle(fontSize: 22, fontWeight: FontWeight.normal,
      color: AppColors.accent);
  static const TextStyle sebhaTabTitle = TextStyle(fontSize: 25, fontWeight: FontWeight.normal ,
      color: AppColors.white);
  static const TextStyle detailsScreen = TextStyle(fontSize: 24,
      color: AppColors.accent);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparent,
    primaryColor: AppColors.primiary,
    dividerTheme: const DividerThemeData(
      thickness: 3,
      color: AppColors.primiary,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.transparent,
      elevation: 0,
      titleTextStyle: appBarTitleTextStyle
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.accent,
      selectedIconTheme: IconThemeData(size: 32),
      unselectedIconTheme: IconThemeData(size: 26)
    ),
    textTheme: const TextTheme(
      bodySmall: settingsOptionTitle,
      bodyMedium: settingsTabTitle,
      displayMedium: quranTabTitleTextStyle,
      titleMedium: sebhaTabTitle,
      bodyLarge: detailsScreen
    )
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparent,
      primaryColor: AppColors.primiaryDark,
      dividerTheme: const DividerThemeData(
        thickness: 3,
        color: AppColors.accentDark,
      ),
      appBarTheme:  AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          titleTextStyle: appBarTitleTextStyle.copyWith(color: AppColors.white)
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.accentDark,
          selectedIconTheme: IconThemeData(size: 32),
          unselectedIconTheme: IconThemeData(size: 26)
      ),
      textTheme: TextTheme(
          bodySmall: settingsOptionTitle.copyWith(color: AppColors.white),
          bodyMedium: settingsTabTitle.copyWith(color: AppColors.white),
          displayMedium: quranTabTitleTextStyle.copyWith(color: AppColors.white),
          titleMedium: sebhaTabTitle.copyWith(color: AppColors.accent),
          bodyLarge: detailsScreen.copyWith(color: AppColors.accentDark)
      )
  );
}