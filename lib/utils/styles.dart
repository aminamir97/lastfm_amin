import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeStyles {
  // * * * * * * * * * * * * *** Light *** * * * * * * * * * * * *

  static ThemeData lightTheme = ThemeData(
      splashColor: const Color.fromRGBO(6, 160, 181, 0.84),
      primaryColor: Colors.white,
      textTheme: TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 40.sp,
              color: Colors.white),
          bodyText1: TextStyle(
              fontSize: 23.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white),
          subtitle1: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(6, 160, 181, 0.84),
          ),
          bodyText2: TextStyle(
            fontSize: 17.sp,
            color: const Color.fromRGBO(6, 160, 181, 0.84),
          )));

  // * * * * * * * * * * * * *** Dark *** * * * * * * * * * * * *
  //static ThemeData darkTheme = ThemeData();
}
