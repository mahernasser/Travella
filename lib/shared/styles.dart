import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';

import 'constants.dart';

ThemeData lightTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: defaultColor,
    unselectedItemColor: secondaryColor,
  ),
  primarySwatch: generateMaterialColor(color: secondaryColor),
  scaffoldBackgroundColor: Colors.white,
  primaryColor: defaultColor,
  drawerTheme: DrawerThemeData(
    backgroundColor: defaultColor,
  ),
  errorColor: defaultColor,
  appBarTheme: AppBarTheme(
    backgroundColor: secondaryColor,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  textTheme: TextTheme(
    displaySmall: const TextStyle(
        color: Colors.black, fontSize: 15, fontFamily: 'oxygen'),
    labelLarge: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontFamily: 'oxygen',
      fontSize: 21,
      overflow: TextOverflow.fade,
    ),
    labelSmall: const TextStyle(
        color: Colors.black,
        fontFamily: 'oxygen',
        fontSize: 15,
        fontWeight: FontWeight.w700),
    labelMedium: TextStyle(
        fontSize: 22,
        color: secondaryColor,
        fontWeight: FontWeight.w800,
        fontFamily: 'oxygen'),
  ),
);

ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      unselectedItemColor: secondaryColor,
      selectedItemColor: defaultColor,
    ),
    primaryColor: defaultColor,
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
    scaffoldBackgroundColor: Colors.black,
    errorColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
          color: Colors.white.withOpacity(0.80),
          fontSize: 30,
          fontFamily: 'oxygen'),
      labelSmall: const TextStyle(
          color: Colors.black,
          fontFamily: 'oxygen',
          fontSize: 15,
          fontWeight: FontWeight.w700),
      labelLarge: const TextStyle(
        color: Colors.white,
        fontFamily: 'oxygen',
        fontSize: 21,
        overflow: TextOverflow.fade,
      ),
      labelMedium: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w800,
          fontFamily: 'oxygen',
          color: Colors.white),
    ));
