import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wheatherapp/model/City.dart';
import 'package:wheatherapp/ui/ui_constanst.dart';

DateFormat format = DateFormat('E, dd MMM yyyy');

class WeathersWidget extends StatelessWidget {
  final List<City> cities;
  final VoidCallback onTap;
  const WeathersWidget({Key key, this.cities, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          final city = cities[index];
          final weather = city.weathers.first;
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/background_states/${weather.weatherStateAbbr}.jpg',
                fit: BoxFit.cover,
              ),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      city.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          shadows: shadows,
                          color: Colors.white),
                    ),
                    Text(
                      format.format(weather.applicableDate),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          shadows: shadows,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            weather.theTemp.toInt().toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w700,
                                shadows: shadows,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'C',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    shadows: shadows,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          weather.weatherStateName,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              shadows: shadows,
                              color: Colors.white),
                        ))
                  ],
                ),
              )
            ],
          );
        },
      ),
      Positioned(
          top: 20,
          left: 20,
          child: IconButton(icon: Icon(Icons.add), onPressed: onTap)),
    ]);
  }
}
