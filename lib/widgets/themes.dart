import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.outfit().fontFamily,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color:Colors.black),
      textTheme: Theme.of(context).textTheme,
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    fontFamily: GoogleFonts.outfit().fontFamily,
    cardColor: Theme.of(context).cardColor,
    canvasColor: darkCreamColor,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color:Colors.black),
      textTheme: Theme.of(context).textTheme,
    ),
  );

  //Colors
static Color creamColor = Color(0xffff5f5f5);
static Color darkCreamColor = Vx.gray800;
static Color darkBluishColor = Color(0xff403b58);
static Color lightBluishColor = Vx.purple400;


}