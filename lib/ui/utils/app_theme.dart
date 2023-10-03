import 'package:flutter/cupertino.dart';
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

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparent,
    primaryColor: AppColors.primiary,
    dividerTheme: DividerThemeData(
      thickness: 3,
      color: AppColors.primiary,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.transparent,
      elevation: 0,
      titleTextStyle: appBarTitleTextStyle
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.accent,
      selectedIconTheme: IconThemeData(size: 32),
      unselectedIconTheme: IconThemeData(size: 26)
    ),
    textTheme: TextTheme(
      bodySmall: settingsOptionTitle,
      bodyMedium: settingsTabTitle,
      displayMedium: quranTabTitleTextStyle
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        textStyle: const TextStyle(
          fontSize: 25,color: AppColors.accent))),
    splashColor: AppColors.transpaernt,
    highlightColor: AppColors.transpaernt
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparent,
      primaryColor: AppColors.primiaryDark,
      dividerTheme: DividerThemeData(
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
          displayMedium: quranTabTitleTextStyle.copyWith(color: AppColors.white)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        textStyle: const TextStyle(
          fontSize: 25,color: AppColors.primary))),
    splashColor: AppColors.transpaernt,
    highlightColor: AppColors.transpaernt
  );

}