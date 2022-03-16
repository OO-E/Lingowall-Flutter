import 'package:lingowall/Extension/Color.dart';
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(
        color: Colors.white
    ),
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 18
    ),
    color: HexColor.fromHex("#161a1d"),
  ),
  scaffoldBackgroundColor: HexColor.fromHex("#0b090a"),


  textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 20.0,
      ),
      headline2: TextStyle(
        color: Colors.amber,
        fontSize: 16,
      ),
      headline3: TextStyle(
        color: Colors.white,
        fontSize: 16,
      )),
  cardTheme: CardTheme(
      color: HexColor.fromHex("#161a1d"),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: 0),
  colorScheme: ColorScheme.fromSwatch().copyWith(

    secondaryVariant: Colors.black,
    secondary: HexColor.fromHex("#fca311"),
    onSecondary: HexColor.fromHex("#161a1d"),
    primaryVariant: Colors.white,
    primary: HexColor.fromHex("#161a1d"),
    onPrimary: HexColor.fromHex("#161a1d"),
    error: HexColor.fromHex("#e63946"),

  ),
);
