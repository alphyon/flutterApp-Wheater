import 'package:wheatherapp/model/City.dart';

abstract class StoreRepository {
  Future<void> saveCity(City city);
  Future<List<City>> getCities();
}
