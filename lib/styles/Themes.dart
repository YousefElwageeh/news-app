import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

darkTheme() => ThemeData(
      scaffoldBackgroundColor: HexColor("#292929"),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backwardsCompatibility: false,
        color: HexColor("#292929"),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor("#292929"),
            statusBarBrightness: Brightness.light),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: HexColor("#292929"),
          // unselectedLabelStyle: TextStyle(color: Colors.grey),
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(
            size: 35,
          ),
          selectedItemColor: Colors.deepOrange),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
lightTheme() => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backwardsCompatibility: false,
        color: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white, statusBarBrightness: Brightness.dark),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            size: 40,
          ),
          selectedItemColor: Colors.deepOrange),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
