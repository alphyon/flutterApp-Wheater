import 'package:flutter/material.dart';
import 'package:wheatherapp/model/City.dart';
import 'package:wheatherapp/ui/cities/add/add_city_bloc.dart';
import 'package:wheatherapp/ui/common/header_widget.dart';
import 'package:wheatherapp/ui/common/loader_widget.dart';
import 'package:wheatherapp/ui/ui_constanst.dart';

class AddCityPages extends StatefulWidget {
  @override
  _AddCityPagesState createState() => _AddCityPagesState();
}

class _AddCityPagesState extends State<AddCityPages> {
  final bloc = AddCityBloc();
  void handleAddTap(City city) async {
    final result = await bloc.addCity(city);
    if (result) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: bloc,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                HeaderWidget(
                  title: 'Agregar Ciudad',
                ),
                const SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: TextField(
                    onChanged: bloc.onChangedText,
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Buscar ciudad',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        )),
                  ),
                ),
                if (bloc.errorMessage != null)
                  Text(
                    bloc.errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: bloc.cities.length,
                      itemBuilder: (context, index) {
                        final city = bloc.cities[index];
                        return ListTile(
                          title: Text(
                            city.title,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: primaryColor,
                            ),
                            onPressed: () {
                              handleAddTap(city);
                            },
                          ),
                        );
                      }),
                ),
                if (bloc.loading)
                  Center(
                    child: LoaderWidget(),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
