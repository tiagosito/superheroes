import 'package:flutter/material.dart';
import 'package:superheroes/model/current_superhero.dart';

class GenderSkillDetail extends StatelessWidget {
  const GenderSkillDetail({
    Key? key,
    required this.currentSuperhero,
  }) : super(key: key);

  final CurrentSuperHero currentSuperhero;

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
            flex: 3,
            child: Text(
              'Gender',
              style: currentSuperhero.textStyleSubTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            flex: 1,
            child: Icon(
                currentSuperhero.isGenderMaleValue == null
                    ? Icons.transgender
                    : currentSuperhero.isGenderMaleValue!
                        ? Icons.male
                        : Icons.female,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
