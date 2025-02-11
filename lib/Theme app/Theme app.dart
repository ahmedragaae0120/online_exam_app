import 'package:flutter/material.dart';
import 'package:online_exam_app/Theme%20app/colors_manager.dart';

class MyThemeData {
  static ThemeData LightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: app_colors.blue_base,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          fontSize: 34,
          color: Colors.grey[700],
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        floatingLabelStyle: TextStyle(
          backgroundColor: Colors.transparent,
          fontSize: 20,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      secondaryHeaderColor: app_colors.black_base,
      appBarTheme: AppBarTheme(
          centerTitle: false,
          color: app_colors.white,
          elevation: 0,
          iconTheme: IconThemeData(size: 35, color: Colors.black),
          shadowColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: app_colors.black_base,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: app_colors.blue_base,
        unselectedItemColor: app_colors.black_30,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(
          color: app_colors.blue_base,
        ),
        unselectedIconTheme: IconThemeData(),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          color: app_colors.blue_base,
        ),
        unselectedLabelStyle: TextStyle(
          color: app_colors.black_30,
        ),
        elevation: 0,
      ),
      textTheme: TextTheme(
        bodySmall: TextStyle(
          color: app_colors.black_base,
          fontFamily: "ELMessiri",
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
        bodyMedium: TextStyle(
          color: app_colors.black_base,
          fontFamily: "ELMessiri",
          fontSize: 17,
          fontWeight: FontWeight.normal,
        ),
        bodyLarge: TextStyle(
          color: app_colors.black_base,
          fontFamily: "ELMessiri",
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
      ));
}
