import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technicmate/theme/palette.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Palette.tmMainBlue,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: Palette.black,
    drawerTheme: const DrawerThemeData(
      backgroundColor: Palette.black,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Palette.white,
      labelStyle: GoogleFonts.cabin(fontSize: 20),
      unselectedLabelStyle: GoogleFonts.cabin(fontSize: 20),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: Palette.white),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.black,
      elevation: 0,
    ),
  );
}
