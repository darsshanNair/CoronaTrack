import 'package:covid_tracker/providers/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as Charts;
import 'package:covid_tracker/app/AppColors.dart';
import 'package:covid_tracker/models/CountryStats.dart';

class CasesLineChart extends StatelessWidget {
  final List<CountryStats> _confirmedCasesStats;
  final List<CountryStats> _recoveredCasesStats;
  final List<CountryStats> _deathCasesStats;
  CasesLineChart(this._confirmedCasesStats, this._recoveredCasesStats,
      this._deathCasesStats);

  List<Charts.Series<CountryStats, DateTime>> _createSeriesList(
    List<CountryStats> _confirmedCasesStats,
    List<CountryStats> _recoveredCasesStats,
    List<CountryStats> _deathsCasesStats,
  ) {
    return [
      Charts.Series<CountryStats, DateTime>(
        id: 'confirmedCasesGraph',
        colorFn: (_, __) => Charts.MaterialPalette.blue.shadeDefault,
        domainFn: (CountryStats stats, _) => stats.date,
        measureFn: (CountryStats stats, _) => stats.casesCount,
        data: _confirmedCasesStats,
      ),
      Charts.Series<CountryStats, DateTime>(
        id: 'recoveredCasesGraph',
        colorFn: (_, __) => Charts.MaterialPalette.green.shadeDefault,
        domainFn: (CountryStats stats, _) => stats.date,
        measureFn: (CountryStats stats, _) => stats.casesCount,
        data: _recoveredCasesStats,
      ),
      Charts.Series<CountryStats, DateTime>(
        id: 'deathsCasesStats',
        colorFn: (_, __) => Charts.MaterialPalette.red.shadeDefault,
        domainFn: (CountryStats stats, _) => stats.date,
        measureFn: (CountryStats stats, _) => stats.casesCount,
        data: _deathsCasesStats,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (_, mainProvider, __) {
        return Expanded(
          child: Charts.TimeSeriesChart(
            _createSeriesList(
              _confirmedCasesStats,
              _recoveredCasesStats,
              _deathCasesStats,
            ),
            animate: true,
            behaviors: [
              Charts.SlidingViewport(),
              Charts.PanAndZoomBehavior(),
            ],
            domainAxis: Charts.DateTimeAxisSpec(
              tickProviderSpec: Charts.DayTickProviderSpec(increments: [15]),
              renderSpec: Charts.SmallTickRendererSpec(
                labelStyle: Charts.TextStyleSpec(
                  fontSize: 12,
                  color: mainProvider.darkModeStatus
                      ? AppColors.luminousBlue
                      : Charts.Color.black,
                ),
              ),
            ),
            primaryMeasureAxis: Charts.NumericAxisSpec(
              renderSpec: Charts.GridlineRendererSpec(
                labelStyle: Charts.TextStyleSpec(
                  fontSize: 12,
                  color: mainProvider.darkModeStatus
                      ? AppColors.luminousBlue
                      : Charts.Color.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
