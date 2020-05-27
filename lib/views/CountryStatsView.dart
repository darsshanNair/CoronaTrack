import 'package:covid_tracker/app/AppStrings.dart';
import 'package:covid_tracker/providers/CountryStatsProvider.dart';
import 'package:covid_tracker/widgets/CasesLineChart.dart';
import 'package:covid_tracker/widgets/DarkModeButton.dart';
import 'package:covid_tracker/widgets/GraphLegends.dart';
import 'package:covid_tracker/widgets/LoadingAnimation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryStatsView extends StatelessWidget {
  final String _countryCode;
  final String _countryName;

  CountryStatsView(this._countryCode, this._countryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          DarkModeButton(),
        ],
        title: Text(_countryName),
      ),
      body: ChangeNotifierProvider<CountryStatsProvider>(
        create: (context) => CountryStatsProvider(_countryCode),
        child: Consumer<CountryStatsProvider>(
          builder: (_, countryStatsProvider, __) {
            return countryStatsProvider.loadingStatus
                ? Container(
                    child: Center(
                      child: LoadingAnimation(),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                            AppStrings.statistics,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CasesLineChart(
                          countryStatsProvider.confirmedCasesStatistics,
                          countryStatsProvider.recoveredCasesStatistics,
                          countryStatsProvider.deathsCasesStatistics,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GraphLegends(),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
