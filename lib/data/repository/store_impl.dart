import 'dart:convert';

import 'package:wheatherapp/data/repository/store_repository.dart';
import 'package:wheatherapp/model/City.dart';
import 'package:shared_preferences/shared_preferences.dart';

const keyCities = 'cities';

class StoreImpl extends StoreRepository {
  @override
  Future<List<City>> getCities() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final list = preferences.getStringList(keyCities);
    if (list != null && list.isNotEmpty) {
      final cities = list
          .map(
            (e) => City.fromJson(
              jsonDecode(e),
            ),
          )
          .toList();
      return cities;
    }
    return <City>[];
  }

  @override
  Future<void> saveCity(City city) async {
    final list = await getCities();
    for (City item in list) {
      if (item.id == city.id) {
        throw new Exception('city exists');
      }
    }
    list.add(city);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList(
        keyCities, list.map((e) => jsonEncode(e.toJson())).toList());
  }
}
