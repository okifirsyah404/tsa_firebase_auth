import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TypographyTheme {
  static TextTheme mainTextTheme(BuildContext context) =>
      GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);

  static TextStyle displayLarge = GoogleFonts.poppins(
    fontSize: 57,
    height: 64,
    fontWeight: FontWeight.w400,
  );

  static TextStyle displayMedium = GoogleFonts.poppins(
    fontSize: 45,
    fontWeight: FontWeight.w400,
  );

  static TextStyle displaySmall = GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w500,
  );

  static TextStyle headlineLarge = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w500,
  );

  static TextStyle headlineMedium = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w400,
  );

  static TextStyle headlineSmall = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleLarge = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );

  static TextStyle titleMedium = GoogleFonts.poppins(
    fontSize: 20,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w400,
  );

  static TextStyle titleRegular = GoogleFonts.poppins(
    fontSize: 18,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w400,
  );

  static TextStyle titleSmall = GoogleFonts.poppins(
    fontSize: 16,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodyLarge = GoogleFonts.poppins(
    fontSize: 18,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 16,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyRegular = GoogleFonts.poppins(
    fontSize: 14,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 12,
    letterSpacing: 0.4,
    fontWeight: FontWeight.w500,
  );

  static TextStyle buttonTextStyle = GoogleFonts.poppins(
    fontSize: 16,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w600,
  );
}
