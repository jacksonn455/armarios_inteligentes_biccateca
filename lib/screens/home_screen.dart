import 'package:armarios_inteligentes/tabs/home_tab.dart';
import 'package:armarios_inteligentes/tabs/places_tab.dart';
import 'package:armarios_inteligentes/tabs/preference_tab.dart';
import 'package:armarios_inteligentes/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        //  floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            title: Text("Preferência"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: PreferenceTab(),
        //  floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            title: Text("Sobre"),
            centerTitle: true,
          ),
          body: PlacesTab(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
