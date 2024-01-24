import "package:flutter/material.dart";

final darktheme = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: Colors.red.shade700,
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.red.shade700,
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 18.0,
      color: Colors.grey,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
    ),
    bodyLarge: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);
