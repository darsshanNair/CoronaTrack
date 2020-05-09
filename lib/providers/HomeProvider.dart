import 'package:covid_tracker/models/CountryInfo.dart';
import 'package:covid_tracker/models/GlobalVirusInfo.dart';
import 'package:covid_tracker/services/VirusInfoService.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  GlobalVirusInfo _globalVirusInfo = GlobalVirusInfo(
    cases: 0,
    active: 0,
    recovered: 0,
    deaths: 0,
  );

  List<CountryInfo> _countriesInfo = [];
  VirusInfoService _virusInfoService;

  HomeProvider() {
    _virusInfoService = VirusInfoService();
    getGlobalVirusInfo();
    getCountriesInfoList();
  }

  GlobalVirusInfo get globalVirusInfo => _globalVirusInfo;
  List<CountryInfo> get countriesInfo => _countriesInfo;

  Future<GlobalVirusInfo> getGlobalVirusInfo() async {
    var response = await _virusInfoService.fetchGlobalVirusInfo();
    if (response is GlobalVirusInfo) {
      _globalVirusInfo = response;
      notifyListeners();
      return _globalVirusInfo;
    } else {
      throw Exception("Error fetching data");
    }
  }

  Future<List<CountryInfo>> getCountriesInfoList() async {
    var response = await _virusInfoService.fetchAllCountriesVirusInfo();
    if (response is List<CountryInfo>) {
      _countriesInfo = response;
      notifyListeners();
      return _countriesInfo;
    } else {
      throw Exception("Error fetching data");
    }
  }
}
