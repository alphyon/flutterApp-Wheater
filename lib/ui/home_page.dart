import 'package:flutter/material.dart';
import 'package:wheatherapp/ui/cities/cities_bloc.dart';
import 'package:wheatherapp/ui/cities/cities_pages.dart';
import 'package:wheatherapp/ui/home/empty_screen.dart';
import 'package:wheatherapp/ui/home/weathers_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = CitiesBloc();

  void handleNavigatePress(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CitiesPage()),
    );
    bloc.loadCities();
  }

  @override
  void initState() {
    bloc.loadCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(bloc.cities.length);
    print(bloc.cities.toString());
    return AnimatedBuilder(
        animation: bloc,
        builder: (context, child) {
          return Scaffold(
            body: bloc.cities.isEmpty
                ? EmptyWidget(
                    onTap: () => handleNavigatePress(context),
                  )
                : WeathersWidget(
                    cities: bloc.cities,
                    onTap: () => handleNavigatePress(context),
                  ),
          );
        });
  }
}
