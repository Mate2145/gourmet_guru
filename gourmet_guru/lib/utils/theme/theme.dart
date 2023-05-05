import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet_guru/utils/theme/widget_themes/button_themes.dart';
import 'package:gourmet_guru/utils/theme/widget_themes/text_field_theme.dart';
import 'package:gourmet_guru/utils/theme/widget_themes/text_theme.dart';

class GGTheme {
  GGTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.lightGreen,
    primaryColor: Colors.black,
    textTheme: GGTextTheme.lightTextTheme,
    outlinedButtonTheme: GGButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: GGButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: GTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
    textTheme: GGTextTheme.darkTextTheme,
    outlinedButtonTheme: GGButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: GGButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: GTextFormFieldTheme.darkInputDecorationTheme,
  );
}
