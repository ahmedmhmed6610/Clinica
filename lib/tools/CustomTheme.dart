import 'package:flutter/material.dart';



class CustomTheme {
  static ThemeData get lightTheme { //1
    return ThemeData( //2
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.black),
        colorScheme: ColorScheme.light(),
        fontFamily: 'Montserrat', //3
        buttonTheme: ButtonThemeData( // 4
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.amberAccent,
        ),
    );
  }


  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey.shade900,
        colorScheme: ColorScheme.dark(),
        appBarTheme: AppBarTheme(color: Colors.black),
        fontFamily: 'Montserrat',
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.amberAccent,
        )
    );
  }

}