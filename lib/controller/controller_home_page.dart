import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:superheroes/controller/controller_superheroes.dart';
import 'package:superheroes/controller/superhero_repository.dart';
import 'package:superheroes/model/current_superhero.dart';
import 'package:superheroes/model/gender_enum.dart';
import 'package:superheroes/model/superhero.dart';
import 'package:superheroes/widget/superhero_details.dart';

mixin ControllerHomePage {
  TextEditingController editingController = TextEditingController();

  final ValueNotifier<GenderEnum?> genderEnum = ValueNotifier(GenderEnum.all);

  ValueNotifier<bool> randomItemExecuted = ValueNotifier(false);

  final ControllerSuperheroes controllerSuperheroes = ControllerSuperheroes();

  void load() async {
    await getAll();
  }

  Future getAll() async {
    controllerSuperheroes.deleteAllSuperheroes();
    controllerSuperheroes.deleteAllCachedItems();

    try {
      var superheroes = await SuperHeroRepository(Dio()).getAll();

      controllerSuperheroes.addAllCachedItems(superheroes);
      controllerSuperheroes.addAllSuperhero();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void executeFilterByGender(GenderEnum? value) {
    genderEnum.value = value;

    if (editingController.value.text.isNotEmpty) {
      filterSearchResults(editingController.value.text);
    }
  }

  void executeRandomItem() {
    if (!randomItemExecuted.value) {
      fetchRandomItem();
    } else {
      backFromFetchRandomItem();
    }

    randomItemExecuted.value = !randomItemExecuted.value;
    //_genderEnum.value = GenderEnum.all;
  }

  Future<void> refresh() async {
    debugPrint("onRefresh");
    controllerSuperheroes.deleteAllSuperheroes();
    controllerSuperheroes.deleteAllCachedItems();
    editingController.clear();
    load();
  }

  void filterSearchResults(String query) {
    randomItemExecuted.value = false;

    if (query.isNotEmpty) {
      query = query.toLowerCase();
      controllerSuperheroes.deleteAllSuperheroes();

      String genderQueryValue = getGenderStringValue();

      var values = genderQueryValue == 'all'
          ? controllerSuperheroes.allCachedSuperhero.where((element) => (element.name.toLowerCase().contains(query))).toList()
          : controllerSuperheroes.allCachedSuperhero
              .where((element) => (element.name.toLowerCase().contains(query) && element.appearance!.gender!.toLowerCase() == genderQueryValue))
              .toList();

      controllerSuperheroes.addSuperheroes(values);
      return;
    } else {
      controllerSuperheroes.deleteAllSuperheroes();
      controllerSuperheroes.addAllSuperhero();
    }
  }

  void fetchRandomItem() {
    controllerSuperheroes.deleteAllSuperheroes();
    controllerSuperheroes.addAllSuperhero();

    String genderQueryValue = getGenderStringValue();

    if (genderQueryValue == 'all') {
      controllerSuperheroes.allSuperhero.shuffle();
      var item = controllerSuperheroes.allSuperhero[0];

      controllerSuperheroes.deleteAllSuperheroes();
      controllerSuperheroes.addSuperhero(item);
    } else {
      var filteredItems = controllerSuperheroes.allCachedSuperhero.where((element) => (element.appearance!.gender!.toLowerCase() == genderQueryValue)).toList();
      if (filteredItems.isNotEmpty) {
        filteredItems.shuffle();
        controllerSuperheroes.deleteAllSuperheroes();
        controllerSuperheroes.addSuperhero(filteredItems[0]);
      }
    }

    editingController.clear();
  }

  void backFromFetchRandomItem() {
    randomItemExecuted.value = true;
    controllerSuperheroes.deleteAllSuperheroes();
    controllerSuperheroes.addAllSuperhero();
  }

  String getGenderStringValue() {
    var genderQueryValue = '';
    switch (genderEnum.value!.index) {
      case 1:
        genderQueryValue = 'male';
        break;
      case 2:
        genderQueryValue = 'female';
        break;
      default:
        genderQueryValue = 'all';
        break;
    }
    return genderQueryValue.toLowerCase();
  }

  CurrentSuperHero getCurrentSuperHero(int index) {
    var superhero = controllerSuperheroes.allSuperhero[index];
    var gender = getGender(superhero);

    CurrentSuperHero currentSuperhero = CurrentSuperHero(
      superhero: superhero,
      gender: gender,
      genderColor: getColorByGender(gender),
      isGenderMaleValue: isGenderMale(gender),
      textStyleTitle: getLiteDescriptionStyle(),
      textStyleSubTitle: getLiteDescriptionStyle(fontSize: 16),
      publisher: getPublisher(superhero),
    );
    return currentSuperhero;
  }

  Future<dynamic> goToSuperHeroDetail(BuildContext context, Size size, CurrentSuperHero currentSuperhero) async {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SuperHeroDetails(
          currentSuperhero: currentSuperhero,
          size: size,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  String getPublisher(Superhero superhero) {
    return superhero.biography == null || superhero.biography?.publisher == null
        ? 'Not loaded'
        : superhero.biography!.publisher!.isEmpty
            ? 'Not loaded'
            : superhero.biography!.publisher!;
  }

  TextStyle getLiteDescriptionStyle({double fontSize = 24.0}) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: 'Roboto',
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  Color getColorByGender(String gender) {
    return gender == '***'
        ? Colors.yellow
        : gender.toLowerCase() == 'male'.toLowerCase()
            ? Colors.red.withOpacity(0.5)
            : Colors.purple.withOpacity(0.7);
  }

  bool? isGenderMale(String gender) {
    return gender == '***'
        ? null
        : gender.toLowerCase() == 'male'.toLowerCase()
            ? true
            : false;
  }

  String getGender(Superhero superhero) => superhero.appearance == null || superhero.appearance?.gender == null
      ? '***'
      : superhero.appearance!.gender!.toLowerCase() != 'male'.toLowerCase() && superhero.appearance!.gender!.toLowerCase() != 'female'.toLowerCase()
          ? '***'
          : superhero.appearance!.gender!;

  // Future<bool> _loadMore() async { //Caso a API suporte paginação
  //   debugPrint("onLoadMore");
  //   if (editingController.text.isEmpty) {
  //     load();
  //   }
  //   return true;
  // }

}
