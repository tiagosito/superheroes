import 'package:flutter/material.dart';
import 'package:superheroes/controller/controller_superheroes.dart';

class ItemsCount extends StatelessWidget {
  const ItemsCount({
    Key? key,
    required this.controllerSuperheroes,
  }) : super(key: key);

  final ControllerSuperheroes controllerSuperheroes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: AnimatedBuilder(
          animation: controllerSuperheroes,
          builder: (context, child) {
            return Text(
              controllerSuperheroes.allSuperhero.isEmpty ? '0 Items' : '${controllerSuperheroes.allSuperhero.length} items',
              style: const TextStyle(fontSize: 12),
            );
          }),
    );
  }
}
