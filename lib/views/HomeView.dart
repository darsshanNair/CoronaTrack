import 'package:covid_tracker/app/AppColors.dart';
import 'package:covid_tracker/providers/HomeProvider.dart';
import 'package:covid_tracker/widgets/DarkModeButton.dart';
import 'package:flutter/material.dart';

import 'package:covid_tracker/app/AppStrings.dart';
import 'package:covid_tracker/views/CountriesView.dart';
import 'package:covid_tracker/views/GeneralView.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  final List<Widget> tabList = [
    GeneralView(),
    CountriesView(),
  ];

  @override
  Widget build(BuildContext context) {
    var _homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          DarkModeButton(),
        ],
        title: Text(AppStrings.appName),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blueGrey,
        backgroundColor: AppColors.primaryBlack,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(AppStrings.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            title: Text(AppStrings.worldWide),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _homeProvider.filterCountriesInfoByQuery("");
        },
      ),
      body: tabList[_currentIndex],
    );
  }
}
