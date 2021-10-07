import 'package:flutter/material.dart';
import 'package:superheroes/model/current_superhero.dart';

class SuperHeroHomePublisher extends StatelessWidget {
  const SuperHeroHomePublisher({
    Key? key,
    required this.size,
    required this.currentSuperhero,
  }) : super(key: key);

  final Size size;
  final CurrentSuperHero currentSuperhero;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.60,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: currentSuperhero.genderColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          currentSuperhero.publisher,
          overflow: TextOverflow.ellipsis,
          style: currentSuperhero.textStyleTitle,
        ),
      ),
    );
  }
}
