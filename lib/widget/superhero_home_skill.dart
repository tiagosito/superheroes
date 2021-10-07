import 'package:flutter/material.dart';
import 'package:superheroes/model/current_superhero.dart';

class SuperHeroHomeSkill extends StatelessWidget {
  const SuperHeroHomeSkill({
    Key? key,
    required this.size,
    required this.skill,
    required this.skillValue,
    required this.currentSuperhero,
  }) : super(key: key);

  final Size size;
  final String skill;
  final String skillValue;
  final CurrentSuperHero currentSuperhero;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.60,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Text(
              skill,
              style: currentSuperhero.textStyleSubTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              skillValue,
              style: currentSuperhero.textStyleSubTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
