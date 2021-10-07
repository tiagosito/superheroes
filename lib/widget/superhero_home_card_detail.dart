import 'package:flutter/material.dart';
import 'package:superheroes/model/current_superhero.dart';
import 'package:superheroes/widget/superhero_home_publisher.dart';
import 'package:superheroes/widget/superhero_home_skill.dart';
import 'package:superheroes/widget/superhero_home_skill_gender.dart';

class SuperHeroHomeCardDetail extends StatelessWidget {
  const SuperHeroHomeCardDetail({
    Key? key,
    required this.size,
    required this.currentSuperhero,
  }) : super(key: key);

  final Size size;
  final CurrentSuperHero currentSuperhero;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140.0,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: size.width * 0.25),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SuperHeroHomePublisher(size: size, currentSuperhero: currentSuperhero),
                const SizedBox(height: 4),
                SuperHeroHomeSkillGender(size: size, currentSuperhero: currentSuperhero),
                const SizedBox(height: 4),
                SuperHeroHomeSkill(
                  size: size,
                  currentSuperhero: currentSuperhero,
                  skill: 'Power',
                  skillValue: currentSuperhero.superhero.powerstats!.power!.toString(),
                ),
                const SizedBox(height: 4),
                SuperHeroHomeSkill(
                  size: size,
                  currentSuperhero: currentSuperhero,
                  skill: 'Speed',
                  skillValue: currentSuperhero.superhero.powerstats!.speed!.toString(),
                ),
                const SizedBox(height: 4),
                SuperHeroHomeSkill(
                  size: size,
                  currentSuperhero: currentSuperhero,
                  skill: 'Strength',
                  skillValue: currentSuperhero.superhero.powerstats!.strength!.toString(),
                ),
              ],
            ),
          ],
        ));
  }
}
