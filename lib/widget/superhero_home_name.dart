import 'package:flutter/material.dart';
import 'package:superheroes/model/current_superhero.dart';

class SuperHeroHomeName extends StatelessWidget {
  const SuperHeroHomeName({
    Key? key,
    required this.size,
    required this.onTap,
    required this.currentSuperhero,
  }) : super(key: key);

  final Size size;
  final Function onTap;
  final CurrentSuperHero currentSuperhero;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: InkWell(
        onTap: () {
          onTap.call();
        },
        child: Container(
          height: 35,
          width: 120,
          color: Colors.black.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            child: Center(
              child: Text(
                currentSuperhero.superhero.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
