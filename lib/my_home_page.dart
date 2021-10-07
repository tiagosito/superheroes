import 'package:flutter/material.dart';
import 'package:superheroes/controller/controller_home_page.dart';

import 'package:superheroes/model/current_superhero.dart';
import 'package:superheroes/model/gender_enum.dart';
import 'package:superheroes/widget/gender_enum_option.dart';
import 'package:superheroes/widget/items_count.dart';
import 'package:superheroes/widget/random_item_button.dart';
import 'package:superheroes/widget/superhero_home_card_detail.dart';
import 'package:superheroes/widget/superhero_home_edit_text.dart';
import 'package:superheroes/widget/superhero_home_image.dart';
import 'package:superheroes/widget/superhero_home_name.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with ControllerHomePage {
  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
        actions: [
          RandomItemButton(
              randomItemExecuted: randomItemExecuted,
              onTap: () {
                executeRandomItem();
              }),
        ],
      ),
      body: Column(
        children: <Widget>[
          SuperHeroHomeEditText(
            editingController: editingController,
            onTap: (value) {
              filterSearchResults(value);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder(
                    valueListenable: genderEnum,
                    builder: (context, value, child) {
                      return Row(
                        children: [
                          GenderEnumOption(
                            genderEnum: genderEnum,
                            skill: 'All',
                            skillValue: GenderEnum.all,
                            onTap: () {
                              executeFilterByGender(GenderEnum.all);
                            },
                          ),
                          GenderEnumOption(
                            genderEnum: genderEnum,
                            skill: 'Male',
                            skillValue: GenderEnum.male,
                            onTap: () {
                              executeFilterByGender(GenderEnum.male);
                            },
                          ),
                          GenderEnumOption(
                            genderEnum: genderEnum,
                            skill: 'Female',
                            skillValue: GenderEnum.female,
                            onTap: () {
                              executeFilterByGender(GenderEnum.female);
                            },
                          ),
                        ],
                      );
                    }),
                ItemsCount(controllerSuperheroes: controllerSuperheroes),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: controllerSuperheroes,
            builder: (context, child) {
              return Expanded(
                child: RefreshIndicator(
                  onRefresh: refresh,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controllerSuperheroes.allSuperhero.length,
                    padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 8),
                    itemBuilder: (context, index) {
                      CurrentSuperHero currentSuperhero = getCurrentSuperHero(index);

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Stack(
                          children: <Widget>[
                            Card(
                              margin: const EdgeInsets.only(top: 30.0),
                              elevation: 5,
                              color: Colors.grey.withOpacity(0.14),
                              child: InkWell(
                                onTap: () {
                                  goToSuperHeroDetail(context, size, currentSuperhero);
                                },
                                child: SuperHeroHomeCardDetail(size: size, currentSuperhero: currentSuperhero),
                              ),
                            ),
                            SuperHeroHomeImage(
                              size: size,
                              currentSuperhero: currentSuperhero,
                              onTap: () {
                                goToSuperHeroDetail(context, size, currentSuperhero);
                              },
                            ),
                            SuperHeroHomeName(
                              size: size,
                              currentSuperhero: currentSuperhero,
                              onTap: () {
                                goToSuperHeroDetail(context, size, currentSuperhero);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          // Expanded( //Caso a API suporte paginação
          //   child: RefreshIndicator(
          //     onRefresh: _refresh,
          //     child: LoadMore(
          //       whenEmptyLoad: false,
          //       onLoadMore: _loadMore,
          //       child: ListView.builder(
          //         shrinkWrap: true,
          //         itemCount: heroes.length,
          //         itemBuilder: (context, index) {
          //           var superhero = heroes[index];
          //           return ListTile(
          //             title: Text(superhero.name),
          //           );
          //         },
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
