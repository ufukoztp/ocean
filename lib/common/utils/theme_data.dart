import 'package:flutter/material.dart';

class AppTheme{
  static  ThemeData get theme {
    return ThemeData(
      appBarTheme: const AppBarTheme(),
      textTheme:  const TextTheme(
        bodySmall: TextStyle(
          color: Colors.grey,
        ),
            bodyLarge: TextStyle(
                color: Colors.white,fontSize: 70,
              fontWeight: FontWeight.w900
            ),
        bodyMedium:  TextStyle(fontWeight: FontWeight.w700,fontSize: 25)

      )
    );
  }






    static Color primaryColor =const Color(0xffD4641F);



}