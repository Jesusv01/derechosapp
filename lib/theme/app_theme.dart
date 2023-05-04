
import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = Colors.blue[900]!;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.blueAccent,

      appBarTheme: AppBarTheme(
        color: primary, 
        elevation: 0
      ),

      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: primary)),

      // Floating Actions Button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
      ),

      // ElevatedButtons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          shape: const StadiumBorder(),
          elevation: 0
          )
      )
  );

    static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.indigo,

      appBarTheme: AppBarTheme(
        color: primary,
        elevation: 0
      ),
  );
}
