import 'package:flutter/material.dart';
import 'package:superheroes/model/current_superhero.dart';
import 'package:superheroes/pages/gender_skill_detail.dart';
import 'package:superheroes/widget/superhero_skills.dart';

class SuperHeroListDetails extends StatelessWidget {
  const SuperHeroListDetails({
    Key? key,
    required this.size,
    required this.currentSuperhero,
  }) : super(key: key);

  final Size size;
  final CurrentSuperHero currentSuperhero;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.99,
      child: Column(
        children: [
          const SizedBox(height: 4),
          const Text(
            'Powerstats',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          GenderSkillDetail(currentSuperhero: currentSuperhero),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Power', skillValue: currentSuperhero.superhero.powerstats!.power!.toString()),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Speed', skillValue: currentSuperhero.superhero.powerstats!.speed!.toString()),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Strength', skillValue: currentSuperhero.superhero.powerstats!.strength!.toString()),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Intelligence', skillValue: currentSuperhero.superhero.powerstats!.intelligence!.toString()),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Durability', skillValue: currentSuperhero.superhero.powerstats!.durability!.toString()),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Combat', skillValue: currentSuperhero.superhero.powerstats!.combat!.toString()),
          const SizedBox(height: 16),
          const Text(
            'Appearence',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          SuperHeroSkills(
              currentSuperhero: currentSuperhero, skill: 'Height', skillValue: currentSuperhero.superhero.appearance!.height!.toString().replaceAll('[', '').replaceAll(']', '')),
          const SizedBox(height: 4),
          SuperHeroSkills(
              currentSuperhero: currentSuperhero, skill: 'Weight', skillValue: currentSuperhero.superhero.appearance!.weight!.toString().replaceAll('[', '').replaceAll(']', '')),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Eye Color', skillValue: currentSuperhero.superhero.appearance!.eyeColor!.toString()),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Hair color', skillValue: currentSuperhero.superhero.appearance!.hairColor!.toString()),
          const SizedBox(height: 16),
          const Text(
            'Biography',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Full name', skillValue: currentSuperhero.superhero.biography!.fullName!.toString()),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Alter Egos', skillValue: currentSuperhero.superhero.biography!.alterEgos!.toString()),
          const SizedBox(height: 4),
          SuperHeroSkills(
              currentSuperhero: currentSuperhero, skill: 'Aliases', skillValue: currentSuperhero.superhero.biography!.aliases!.toString().replaceAll('[', '').replaceAll(']', '')),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'First Appearance', skillValue: currentSuperhero.superhero.biography!.firstAppearance!.toString()),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Alignment', skillValue: currentSuperhero.superhero.biography!.alignment!.toString()),
          const SizedBox(height: 16),
          const Text(
            'Work',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Occupation', skillValue: currentSuperhero.superhero.work!.occupation!.toString()),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Base', skillValue: currentSuperhero.superhero.work!.base!.toString()),
          const SizedBox(height: 16),
          const Text(
            'Connections',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Group Affiliation', skillValue: currentSuperhero.superhero.connections!.groupAffiliation!.toString()),
          const SizedBox(height: 4),
          SuperHeroSkills(currentSuperhero: currentSuperhero, skill: 'Relatives', skillValue: currentSuperhero.superhero.connections!.relatives!.toString()),
        ],
      ),
    );
  }
}
