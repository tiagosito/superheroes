import 'package:flutter/material.dart';
import 'package:superheroes/model/current_superhero.dart';

class SuperheroPublisherDetails extends StatelessWidget {
  const SuperheroPublisherDetails({
    Key? key,
    required this.size,
    required this.currentSuperhero,
  }) : super(key: key);

  final Size size;
  final CurrentSuperHero currentSuperhero;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: size.width,
      decoration: BoxDecoration(
        color: currentSuperhero.genderColor,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
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
