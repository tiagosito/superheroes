import 'package:flutter/material.dart';
import 'package:superheroes/model/superhero.dart';

class ControllerSuperheroes extends ChangeNotifier {
  final List<Superhero> _heroes = [];
  final List<Superhero> _heroesCachedItems = [];

  List<Superhero> get allSuperhero => _heroes;
  List<Superhero> get allCachedSuperhero => _heroesCachedItems;

  void addSuperhero(Superhero hero) {
    _heroes.add(hero);
    notifyListeners();
  }

  void deleteSuperheroes(Superhero hero) {
    _heroes.remove(hero);
    notifyListeners();
  }

  void addAllSuperhero() {
    _heroes.addAll(_heroesCachedItems);
    notifyListeners();
  }

  void addSuperheroes(List<Superhero> heroes) {
    _heroes.addAll(heroes);
    notifyListeners();
  }

  void deleteAllSuperheroes() {
    _heroes.clear();
    notifyListeners();
  }

  void addAllCachedItems(List<Superhero> heroes) {
    _heroesCachedItems.addAll(heroes);
    notifyListeners();
  }

  void deleteAllCachedItems() {
    _heroesCachedItems.clear();
    notifyListeners();
  }
}
