import 'package:flutter/material.dart';

const textColor = Colors.black;
final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color(0xffE2E7FF),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: 5, horizontal: 12)),
            overlayColor:
                WidgetStatePropertyAll<Color>(Colors.grey.withOpacity(0.1)),
            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            minimumSize: WidgetStateProperty.all<Size>(Size(0, 56)),
            maximumSize: WidgetStateProperty.all<Size>(Size(0, 56)),
            backgroundColor: WidgetStatePropertyAll<Color>(Color(0xff0183FF)),
            // padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
            //     const EdgeInsets.symmetric(vertical: 16, horizontal: 32)),
            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))))),
    textTheme: TextTheme(
      labelLarge: TextStyle(
          color: textColor,
          fontSize: 30,
          fontWeight: FontWeight.w900,
          fontFamily: 'Yekan'),
      labelMedium: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'Yekan'),
      labelSmall: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Yekan'),
      displayMedium: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Yekan'),
      displaySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Yekan',
          color: Color(0xff8A8A8A)),
      displayLarge: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: 'Yekan'),
    ),
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xff0183FF),
        onPrimary: Colors.white,
        secondary: Colors.white,
        onSecondary: Colors.white,
        secondaryContainer: Color(0xffE1E8EA),
        onSecondaryContainer: Colors.black,
        tertiary: Color(0xffB9D1D7),
        error: Colors.red,
        onError: Colors.red,
        surface: Color(0xffF0F3F4),
        onSurface: Colors.black));
