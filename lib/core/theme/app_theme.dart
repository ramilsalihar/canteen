import 'package:canteen/core/theme/colors/app_colors.dart';
import 'package:canteen/core/theme/dimens/dimens.dart';
import 'package:canteen/core/theme/text/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final dimens = Dimens();

class AppTheme {
  static const _lightColors = appColorsLight;

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _lightColors.primaryColor,
    colorScheme: ColorScheme.light(
      primary: _lightColors.primaryColor,
      secondary: _lightColors.secondaryColor,
      tertiary: _lightColors.accentColor,
    ),
    cardColor: _lightColors.grey,
    fontFamily: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
    ).fontFamily,
    textTheme: AppTextTheme(
      colors: _lightColors,
      dimens: dimens,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all(_lightColors.primaryColor),
        iconSize: MaterialStateProperty.all(dimens.iconSize),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _lightColors.grey,
      selectedIconTheme: IconThemeData(
        color: _lightColors.white,
        size: dimens.iconSize,
      ),
      unselectedIconTheme: IconThemeData(
        color: _lightColors.primaryColor,
        size: dimens.iconSize,
      ),
    ),
  );

  static const _darkColors = appColorsDark;

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _darkColors.primaryColor,
    fontFamily: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
    ).fontFamily,
    textTheme: AppTextTheme(
      colors: _darkColors,
      dimens: dimens,
    ),
  );
}
