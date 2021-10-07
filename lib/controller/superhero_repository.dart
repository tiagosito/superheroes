import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:superheroes/model/superhero.dart';
import 'package:superheroes/shared/utils.dart';

abstract class ISuperHeroRepository {
  Future<List<Superhero>> getAll({String? url});
}

class SuperHeroRepository implements ISuperHeroRepository {
  final Dio _dio;

  SuperHeroRepository(
    this._dio,
  );

  @override
  Future<List<Superhero>> getAll({String? url}) async {
    try {
      Response response = await _dio.get(url ?? ConstValues.url);
      List<Superhero> listTemp = [];

      listTemp = (response.data as List).map((item) {
        return Superhero.fromMap(item);
      }).toList();

      return listTemp;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
