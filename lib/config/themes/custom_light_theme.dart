import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLightTheme {
  static const Color primaryColor = Color(0xff5F33E1);
  static const Color secondaryColor = Color(0xff24252C);
  static const Color backgroundColor = Color(0xffDDDDDD);
  static const Color secondaryBorderColor = Color(0xff6E6A7C);

  // Fonts colors
  static const Color primaryFontColor = Color(0xff24252C);
  static const Color secondaryFontColor = Color(0xff6E6A7C);

  static final TextStyle defaultFontStyle = GoogleFonts.manrope();

  static final TextTheme textTheme = TextTheme(
    headlineLarge: defaultFontStyle,
    headlineMedium: defaultFontStyle,
    headlineSmall: defaultFontStyle,
    bodyLarge: defaultFontStyle,
    bodyMedium: defaultFontStyle,
    bodySmall: defaultFontStyle,
    displayLarge: defaultFontStyle,
    displayMedium: defaultFontStyle,
    displaySmall: defaultFontStyle,
    titleLarge: defaultFontStyle,
    titleMedium: defaultFontStyle,
    titleSmall: defaultFontStyle,
    labelLarge: defaultFontStyle,
    labelMedium: defaultFontStyle,
    labelSmall: defaultFontStyle,
  );

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: primaryColor,
    textTheme: textTheme,
    scaffoldBackgroundColor: backgroundColor,
  );
}
