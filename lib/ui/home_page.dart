import 'package:flutter/material.dart';
import 'package:wheatherapp/ui/cities/cities_pages.dart';
import 'package:wheatherapp/ui/ui_constanst.dart';

class HomePage extends StatelessWidget {
  void handleNavigatePress(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CitiesPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned.fill(child: Image.asset('assets/welcome.jpg')),
        SafeArea(
            child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: maxPageWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/logo.png',
                  height: 50,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text('Hola \nBienvenido',
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Que te parace si agregamos\nuna nueva ciudad?',
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text('Agregar Ciudad'),
                  onPressed: () => handleNavigatePress(context),
                )
              ],
            ),
          ),
        ))
      ],
    ));
  }
}
