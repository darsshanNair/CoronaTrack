import 'package:covid_tracker/app/AppColors.dart';
import 'package:covid_tracker/providers/MainProvider.dart';
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
  bool _isDisplayHomePage = true;

  @override
  Widget build(BuildContext context) {
    var _mainProvider = Provider.of<MainProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(_mainProvider.darkModeStatus
                ? Icons.lightbulb_outline
                : Icons.highlight),
            onPressed: () {
              _mainProvider.darkModeStatus = !_mainProvider.darkModeStatus;
            },
          )
        ],
        title: Text(AppStrings.appName),
        centerTitle: false,
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.primaryBlack,
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isDisplayHomePage = true;
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(
                  Icons.flag,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isDisplayHomePage = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: _isDisplayHomePage ? GeneralView() : CountriesView(),
    );
  }
}
