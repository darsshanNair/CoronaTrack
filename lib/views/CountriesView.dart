import 'package:covid_tracker/app/AppStrings.dart';
import 'package:covid_tracker/providers/HomeProvider.dart';
import 'package:covid_tracker/widgets/CountryCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _homeProvider = Provider.of<HomeProvider>(context);

    return _homeProvider.countriesInfo.isEmpty
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : RefreshIndicator(
            onRefresh: () {
              return _homeProvider.getCountriesInfoList();
            },
            child: ListView.builder(
              itemCount: _homeProvider.countriesInfo.length,
              itemBuilder: (context, index) {
                return Container(
                  child: CountryCard(
                    _homeProvider.countriesInfo[index].country,
                    _homeProvider.countriesInfo[index].countryInfo.flag,
                    _homeProvider.countriesInfo[index].cases,
                    _homeProvider.countriesInfo[index].todayCases,
                    _homeProvider.countriesInfo[index].active,
                    _homeProvider.countriesInfo[index].recovered,
                    _homeProvider.countriesInfo[index].deaths,
                    _homeProvider.countriesInfo[index].todayDeaths,
                  ),
                );
              },
            ),
          );
  }
}
