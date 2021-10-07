import 'package:flutter/material.dart';
import 'package:superheroes/model/current_superhero.dart';

class SuperHeroSkills extends StatelessWidget {
  const SuperHeroSkills({
    Key? key,
    required this.currentSuperhero,
    required this.skill,
    required this.skillValue,
  }) : super(key: key);

  final CurrentSuperHero currentSuperhero;
  final String skill;
  final String skillValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 50),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Text(
              skill,
              style: currentSuperhero.textStyleSubTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            flex: 3,
            child: Text(
              skillValue,
              style: currentSuperhero.textStyleSubTitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
