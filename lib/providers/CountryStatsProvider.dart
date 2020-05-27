import 'package:covid_tracker/models/CountryStats.dart';
import 'package:covid_tracker/services/VirusInfoService.dart';
import 'package:flutter/material.dart';

class CountryStatsProvider with ChangeNotifier {
  List<CountryStats> _confirmedCasesStatistics = [];
  List<CountryStats> _recoveredCasesStatistics = [];
  List<CountryStats> _deathsCasesStatistics = [];
  VirusInfoService _virusInfoService;
  bool _isDataLoading = false;

  CountryStatsProvider(String countryCode) {
    _virusInfoService = VirusInfoService();
    getAllStatisticalData(countryCode);
  }

  List<CountryStats> get confirmedCasesStatistics => _confirmedCasesStatistics;
  List<CountryStats> get recoveredCasesStatistics => _recoveredCasesStatistics;
  List<CountryStats> get deathsCasesStatistics => _deathsCasesStatistics;
  bool get loadingStatus => _isDataLoading;

  Future<List<CountryStats>> getStatisticalDataByCountry(
      String countryCode, CaseStatus status) async {
    var response = await _virusInfoService.fetchTotalCountryCasesByDateRange(
        countryCode, status);

    if (response is List<CountryStats>) {
      switch (status) {
        case CaseStatus.confirmed:
          _confirmedCasesStatistics = response;
          notifyListeners();
          return _confirmedCasesStatistics;

        case CaseStatus.recovered:
          _recoveredCasesStatistics = response;
          notifyListeners();
          return _recoveredCasesStatistics;

        case CaseStatus.deaths:
          _deathsCasesStatistics = response;
          notifyListeners();
          return _deathsCasesStatistics;

        default:
          _confirmedCasesStatistics = response;
          notifyListeners();
          return _confirmedCasesStatistics;
      }
    } else {
      throw Exception("Error fetching data");
    }
  }

  Future getAllStatisticalData(String countryCode) async {
    var statisticalDataFutures = List<Future>();
    _isDataLoading = true;
    statisticalDataFutures
        .add(getStatisticalDataByCountry(countryCode, CaseStatus.confirmed));
    statisticalDataFutures
        .add(getStatisticalDataByCountry(countryCode, CaseStatus.recovered));
    statisticalDataFutures
        .add(getStatisticalDataByCountry(countryCode, CaseStatus.deaths));
    await Future.wait(statisticalDataFutures);
    _isDataLoading = false;
  }
}
