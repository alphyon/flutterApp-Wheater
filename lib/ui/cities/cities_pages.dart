import 'package:flutter/material.dart';
import 'package:wheatherapp/model/City.dart';
import 'package:wheatherapp/ui/cities/add/add_city_pages.dart';
import 'package:wheatherapp/ui/cities/cities_bloc.dart';
import 'package:wheatherapp/ui/common/header_widget.dart';
import 'package:wheatherapp/ui/ui_constanst.dart';

class CitiesPage extends StatefulWidget {
  @override
  _CitiesPageState createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  final bloc = CitiesBloc();
  @override
  void initState() {
    bloc.loadCities();
    super.initState();
  }

  void handleNavigatePress(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => AddCityPages()),
    );
    bloc.loadCities();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: bloc,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: primaryColor,
              onPressed: () => handleNavigatePress(context),
            ),
            body: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: <Widget>[
                  HeaderWidget(
                    title: 'Mis Ciudades',
                  ),
                  Expanded(
                    child: bloc.cities.isEmpty
                        ? Center(
                            child: Text(
                              'No tienes ciudades 😕',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          )
                        : ListView.builder(
                            itemCount: bloc.cities.length,
                            itemBuilder: (context, index) {
                              final city = bloc.cities[index];
                              return CityItem(
                                city: city,
                              );
                            }),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class CityItem extends StatelessWidget {
  final City city;
  const CityItem({Key key, this.city}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              city.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Icon(Icons.close),
            )
          ],
        ),
      ),
    );
  }
}
