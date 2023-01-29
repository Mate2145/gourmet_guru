import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class GGButtonTheme {
  GGButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: Colors.white,
      backgroundColor: ggPrimaryColor,
      side: BorderSide(color: Colors.black),
      padding: EdgeInsets.symmetric(vertical: 15),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: Colors.white,
      backgroundColor: ggPrimaryColor,
      side: BorderSide(color: Colors.black),
      padding: EdgeInsets.symmetric(vertical: 15),
    ),
  );

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: Colors.black,
      side: BorderSide(color: Colors.black),
      padding: EdgeInsets.symmetric(vertical: 15),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: Colors.black,
      side: BorderSide(color: Colors.black),
      padding: EdgeInsets.symmetric(vertical: 15),
    ),
  );
}
