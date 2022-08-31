import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightingTheme() => ThemeData(

  primarySwatch: Colors.grey,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(color: Colors.black),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light),

    elevation: 0.0,

    titleTextStyle: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
  ),
);