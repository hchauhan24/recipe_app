import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

border([Color color = const Color(0xFF56514D)]) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 1),
    borderRadius: BorderRadius.circular(5));
//LIGHT MODE
final ThemeData lightMode = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    brightness: Brightness.light,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.lato(color: Colors.black, fontSize: 20),
      headlineSmall: GoogleFonts.lato(color: Colors.black87, fontSize: 18),
      labelSmall: GoogleFonts.lato(
        color: Colors.black87,
        fontSize: 14,
      ),
      titleSmall: GoogleFonts.lato(color:Colors.black87,fontSize: 16)
    ),
    colorScheme: const ColorScheme.light(
        surface: Color(0xffFAF9F6),
        primary: Color(0xffFEBD2F),
        secondary: Color(0xffDCDCDC),
        inversePrimary: Colors.black87,
        tertiary:  Color(0xffF6B17A ),
        ),
    iconTheme: const IconThemeData(color: Colors.black),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(24),
      enabledBorder: border(),
      focusedBorder: border(const Color(0xffF6B17A )),
    ));

/*
|
|
|
|
|
|
|
|
*/

//DARK MODE
final ThemeData darkMode = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.lato(color: Colors.white, fontSize: 20),
      headlineSmall: GoogleFonts.lato(color: Colors.grey, fontSize: 18),
      labelSmall: GoogleFonts.lato(
          color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
    ),
    colorScheme: const ColorScheme.dark(
      surface: Color.fromARGB(255, 30, 30, 30),
      primary: Color.fromARGB(255, 122, 122, 122),
      inversePrimary: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white));
