// ignore_for_file: file_names

import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weathersample/Theme/weather_theme.dart';

class Style {
  // set a Boolean value to fuctch from main dart page (is the theme dark or Ligth)
  static ThemeData themeData(bool isthemedark, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: isthemedark ? darkblue : blue,
        primaryColor: blue,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: isthemedark ? darkblue : white,
              brightness: isthemedark ? Brightness.dark : Brightness.light,
            ),
        textTheme: TextTheme(
          titleSmall:
              GoogleFonts.overpass(fontSize: 18, fontWeight: FontWeight.w400),
          titleLarge:
              GoogleFonts.heebo(fontSize: 41, fontWeight: FontWeight.w600),
          titleMedium:
              GoogleFonts.nunito(fontSize: 41, fontWeight: FontWeight.w600),
          labelMedium:
              GoogleFonts.nunito(fontSize: 28, fontWeight: FontWeight.w400),
          labelLarge: GoogleFonts.josefinSans(
              fontSize: 22, fontWeight: FontWeight.w400),
          labelSmall: GoogleFonts.josefinSans(
              color: isthemedark ? black : white,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        cardTheme: CardTheme(
          color: isthemedark ? gray : gray,
        ),
        appBarTheme: AppBarTheme(color: isthemedark ? gray : white),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(isthemedark ? blue : darkblue))));
  }
}
