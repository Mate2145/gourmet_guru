import 'package:flutter/material.dart';
import 'package:ki_mit_talal/constants/colors.dart';

class GTextFormFieldTheme {
  GTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: ggPrimaryColor,
          floatingLabelStyle: TextStyle(color: ggPrimaryColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ggPrimaryColor),
          ));


    static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: ggSecondaryColor,
          floatingLabelStyle: TextStyle(color: ggSecondaryColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ggSecondaryColor),
          ));


}
