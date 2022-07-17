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
  dividerColor: Colors.white,
  textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 18.0,
      ),
      headline2: TextStyle(
        color: Colors.blue,
        fontSize: 14.0,
      ),
      headline3: TextStyle(
        color: Colors.white,
        fontSize: 12.0,
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
    secondary: Colors.blue,
    onSecondary: HexColor.fromHex("#161a1d"),
    primaryVariant: Colors.white,
    primary: HexColor.fromHex("#161a1d"),
    onPrimary: HexColor.fromHex("#161a1d"),
    error: HexColor.fromHex("#e63946"),


  ),
);
