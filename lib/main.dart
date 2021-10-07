import 'package:flutter/material.dart';
import 'package:superheroes/my_home_page.dart';
import 'package:superheroes/shared/utils.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstValues.title,
      theme: ConstValues.themeData,
      home: const MyHomePage(title: ConstValues.title),
    );
  }
}
