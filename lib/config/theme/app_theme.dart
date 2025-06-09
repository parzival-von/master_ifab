import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorum = <Color> [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,

];

class AppTheme {

final int electusColor;
final bool tenebrisModusEst;

AppTheme({
  
  this.electusColor = 0,
  this.tenebrisModusEst = false
  });

ThemeData getTheme() => ThemeData(

  brightness: 
      tenebrisModusEst 
          ? Brightness.dark 
          : Brightness.light,
          
  colorSchemeSeed: colorum[electusColor],

  appBarTheme: const AppBarTheme(
    centerTitle: false,
  ),

textTheme: TextTheme(
  titleLarge: GoogleFonts.montserratAlternates(),
  titleMedium: GoogleFonts.montserratAlternates(fontSize: 35),
  bodyLarge: GoogleFonts.montserratAlternates(fontSize: 20),
  bodyMedium: GoogleFonts.russoOne(fontSize: 16),
)

);

}
