import 'package:flutter/material.dart';
import 'package:superheroes/model/current_superhero.dart';
import 'package:superheroes/widget/superhero_image_details.dart';
import 'package:superheroes/widget/superhero_list_details.dart';
import 'package:superheroes/widget/superhero_publisher_details.dart';

class SuperHeroDetails extends StatelessWidget {
  final Size size;
  final CurrentSuperHero currentSuperhero;
  const SuperHeroDetails({Key? key, required this.currentSuperhero, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: currentSuperhero.superhero.id,
        child: Material(
          type: MaterialType.transparency,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 1.0, bottom: 128.0, left: 8.0, right: 8.0),
              child: Column(
                children: [
                  SuperheroPublisherDetails(size: size, currentSuperhero: currentSuperhero),
                  SuperHeroImageDetails(currentSuperhero: currentSuperhero, size: size),
                  const SizedBox(height: 8),
                  SuperHeroListDetails(size: size, currentSuperhero: currentSuperhero),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
