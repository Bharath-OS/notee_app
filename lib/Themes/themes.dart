import 'package:flutter/material.dart';
import 'package:notes_app/Constants/constants.dart';

class MyTheme {
  static TextStyle headingStyle = TextStyle(
    fontFamily: "Roboto",
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: MyColors.primaryColor,
  );

  static TextStyle bodyMediumStyle = TextStyle(
    color: MyColors.lightDarkTextColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleLargeStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 50,
    fontFamily: "Roboto"
  );
  static TextStyle titleMediumStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 30,
      fontFamily: "Roboto"
  );

  static InputDecoration textFieldStyle = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    isDense: true,
    contentPadding: EdgeInsets.only(
      left: 55.0,
      right: 55.0,
      top: 10.0,
      bottom: 10.0,
    ),
    hintStyle: TextStyle(
      color: MyColors.tertiaryColor,
      fontWeight: FontWeight.bold,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(width: 3, color: MyColors.primaryColor),
    ),
  );

  static final primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: MyColors.primaryColor,
    foregroundColor: Colors.white,
  );
  static final secondaryButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: MyColors.primaryColor,
    backgroundColor: Colors.white,
  );
}
