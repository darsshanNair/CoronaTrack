import 'package:covid_tracker/models/CountryInfo.dart';
import 'package:covid_tracker/providers/HomeProvider.dart';
import 'package:covid_tracker/widgets/CountryCard.dart';
import 'package:covid_tracker/widgets/loadingAnimation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountriesView extends StatelessWidget {
  Widget renderCountriesListView(List<CountryInfo> _countriesList) {
    return (ListView.builder(
      itemCount: _countriesList.length,
      itemBuilder: (context, index) {
        return Container(
          child: CountryCard(
            _countriesList[index].country,
            _countriesList[index].countryInfo.countryCode,
            _countriesList[index].countryInfo.flag,
            _countriesList[index].cases,
            _countriesList[index].todayCases,
            _countriesList[index].active,
            _countriesList[index].recovered,
            _countriesList[index].deaths,
            _countriesList[index].todayDeaths,
          ),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    var _homeProvider = Provider.of<HomeProvider>(context);

    return _homeProvider.countriesInfo.isEmpty
        ? Container(
            child: Center(
              child: LoadingAnimation(),
            ),
          )
        : RefreshIndicator(
            onRefresh: () {
              return _homeProvider.getCountriesInfoList();
            },
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  onChanged: (filterQuery) {
                    _homeProvider.filterCountriesInfoByQuery(filterQuery);
                  },
                ),
                Expanded(
                  child: this.renderCountriesListView(
                      _homeProvider.filteredCountriesInfo),
                )
              ],
            ),
          );
  }
}
