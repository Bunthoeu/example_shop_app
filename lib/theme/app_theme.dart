import 'package:flutter/material.dart';
import 'package:product_shop_api/theme/color.dart';

ThemeData get appTheme {
    return ThemeData(
      primaryColor:AppColors.gryColor,
      primaryColorDark:  AppColors.gryColor,
      canvasColor: Color(0xffF2F2F2),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      primaryTextTheme: TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.black,
      ),
      splashColor: Colors.black12,
     
      
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 72.0,
          color: AppColors.gryColor,
        ),
        headlineMedium: TextStyle(fontSize: 36.0, color: AppColors.gryColor,),
        headlineSmall: TextStyle(
          fontSize: 24.0,
          color: AppColors.gryColor,
        ),
     
      ),
    );
  }