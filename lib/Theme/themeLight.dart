import 'package:lingowall/Extension/Color.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
        color: Colors.white
    ),
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 18
    ),
    color: Colors.blue,
  ),
  scaffoldBackgroundColor: HexColor.fromHex("#ffffff"),


  
  textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 20.0,
      ),
      headline2: TextStyle(
        color: Colors.amber,
        fontSize: 16,
      ),
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 16,
      )),
  cardTheme: CardTheme(
      color: HexColor.fromHex("#e5e5e5"),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: 0),
  colorScheme: ColorScheme.fromSwatch().copyWith(

    secondaryVariant: Colors.white,
    secondary: HexColor.fromHex("#fca311"),
    onSecondary: HexColor.fromHex("#ffffff"),
    primaryVariant: Colors.black,
    primary: HexColor.fromHex("#14213d"),
    onPrimary: HexColor.fromHex("#e5e5e5"),
    error: HexColor.fromHex("#e63946"),

  ),
);
