import 'package:flutter/material.dart';

class ConstValues {
  static const String title = 'Superhero';
  static const String url = 'https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json';
  static const String cachedNetworkImagePlaceholder = 'http://via.placeholder.com/350x150';
  static ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      focusColor: Colors.white,
      hintStyle: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
      floatingLabelStyle: TextStyle(fontStyle: FontStyle.italic, fontSize: 16, color: Colors.white),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
      ),
    ),
  );
}
