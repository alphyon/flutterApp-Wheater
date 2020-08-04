import 'package:flutter/material.dart';
import 'package:wheatherapp/ui/cities/add/add_city_pages.dart';
import 'package:wheatherapp/ui/common/header_widget.dart';
import 'package:wheatherapp/ui/ui_constanst.dart';

class CitiesPage extends StatelessWidget {
  void handleNavigatePress(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => AddCityPages()),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                child: Center(
              child: Text(
                'No tienes ciudades 😕',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
