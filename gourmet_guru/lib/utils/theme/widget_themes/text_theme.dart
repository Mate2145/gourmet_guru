import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet_guru/constants/colors.dart';

class GGTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText2: GoogleFonts.montserrat(
      color: Colors.black,
    ),
    headline3: GoogleFonts.montserrat(
      color: Colors.black87,
    ),
    headline4: GoogleFonts.montserrat(
      color: Colors.black87,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    bodyText2: GoogleFonts.montserrat(
      color: Colors.white,
    ),
    headline3: GoogleFonts.montserrat(
      color: ggPrimaryColor,
    ),
  );
}
