import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kDarkColorScheme = ColorScheme.fromSeed(seedColor: Colors.black);

void main() {
  runApp(
    MaterialApp(
      //setting up theme

      //dark theme
      darkTheme: ThemeData.dark(),

      theme: ThemeData().copyWith(
        //backgroudn theme
        scaffoldBackgroundColor: const Color(0xFF9598ff),

        //app bar
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: const Color(0xFF9598ff),
        ),

        //card theme
        cardTheme: const CardTheme().copyWith(
          color: const Color(0xFFfec7c9),
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
        ),

        //button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF9598ff),
            foregroundColor: Colors.white,
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          titleMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),

      themeMode: ThemeMode.system,

      debugShowCheckedModeBanner: false,

      home: const Expenses(),
    ),
  );
}
