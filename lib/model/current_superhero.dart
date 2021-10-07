import 'package:flutter/material.dart';
import 'package:superheroes/model/superhero.dart';

class CurrentSuperHero {
  final Superhero superhero;
  final String gender;
  final Color genderColor;
  final bool? isGenderMaleValue;
  final TextStyle textStyleTitle;
  final TextStyle textStyleSubTitle;
  final String publisher;

  const CurrentSuperHero({
    required this.superhero,
    required this.gender,
    required this.genderColor,
    required this.isGenderMaleValue,
    required this.textStyleTitle,
    required this.textStyleSubTitle,
    required this.publisher,
  });
}
