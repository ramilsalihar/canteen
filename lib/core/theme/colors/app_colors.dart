import 'package:canteen/core/theme/colors/dark_theme_color.dart';
import 'package:canteen/core/theme/colors/light_theme_color.dart';
import 'package:flutter/material.dart';

const appColorsLight = AppColorsLight();
const appColorsDark = AppColorsDark();

abstract class AppColors {
  const AppColors();

  Color get primaryColor;

  Color get secondaryColor;

  Color get accentColor;

  Color get white;

  Color get black;

  Color get grey;

  static AppColors of(BuildContext context) {
    switch (Theme.of(context).brightness) {
      case Brightness.light:
        return appColorsLight;
      case Brightness.dark:
        return appColorsDark;
    }
  }
}
