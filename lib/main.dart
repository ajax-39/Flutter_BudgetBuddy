import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
// import 'package:flutter/services.dart';

var kDarkColorScheme = ColorScheme.fromSeed(seedColor: Colors.black);

void main() {
  //set the orientation
  //lock in portrait
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {});
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
              textStyle: TextStyle(
                fontSize: 16,
              )),
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

      themeMode: ThemeMode.light,

      debugShowCheckedModeBanner: false,

      home: const Expenses(),
    ),
  );
}
