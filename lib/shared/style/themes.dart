import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData light = ThemeData(
  indicatorColor: mainColor,
  dividerColor: const Color.fromARGB(255, 216, 213, 213),
  cardColor: Colors.white,
  iconTheme: const IconThemeData(color: mainColor),
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black),
      bodySmall: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 12, color: Colors.grey),
      titleLarge: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black)),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      elevation: 20,
      selectedLabelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: mainColor),
  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: mainColor,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: mainColor, fontSize: 25, fontWeight: FontWeight.bold)),
  primarySwatch: Colors.cyan,
);
ThemeData dark = ThemeData(
  indicatorColor: mainColor,
  dividerColor: Colors.grey,
  cardColor: darkScaffoldColor,
  iconTheme: const IconThemeData(color: mainColor),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
    bodySmall: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 12, color: Colors.grey),
    titleLarge: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
  ),
  scaffoldBackgroundColor: darkScaffoldColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.white,
      backgroundColor: darkScaffoldColor,
      elevation: 20,
      selectedLabelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: mainColor),
  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: mainColor,
      ),
      backgroundColor: darkScaffoldColor,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: mainColor, fontSize: 25, fontWeight: FontWeight.bold)),
  primarySwatch: Colors.cyan,
);
