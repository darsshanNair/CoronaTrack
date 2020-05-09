import 'package:covid_tracker/app/AppTheme.dart';
import 'package:covid_tracker/providers/HomeProvider.dart';
import 'package:covid_tracker/providers/MainProvider.dart';
import 'package:covid_tracker/views/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(CovidApp());
}

class CovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainProvider>(
            create: (BuildContext context) => MainProvider()),
        ChangeNotifierProvider<HomeProvider>(
            create: (BuildContext context) => HomeProvider()),
      ],
      child: MaterialAppWrapper(),
    );
  }
}

class MaterialAppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _mainProvider = Provider.of<MainProvider>(context);
    return MaterialApp(
      title: 'Covid-19 Tracker',
      debugShowCheckedModeBanner: false,
      theme: _mainProvider.darkModeStatus
          ? AppTheme.darkTheme
          : AppTheme.lightTheme,
      home: HomeView(),
    );
  }
}
