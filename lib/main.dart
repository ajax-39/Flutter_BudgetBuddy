import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      //setting up theme

      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: const Color(0xFF9598ff),

        //app bar
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: const Color(0xFF9598ff),
        ),

        //card theme
        cardTheme: const CardTheme().copyWith(
          color: const Color(0xFFa9feff),
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
        ),

        //button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF11d296),
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

      debugShowCheckedModeBanner: false,

      home: const Expenses(),
    ),
  );
}
