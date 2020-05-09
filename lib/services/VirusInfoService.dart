import 'package:covid_tracker/models/CountryInfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:covid_tracker/app/AppConstants.dart';
import 'package:covid_tracker/models/GlobalVirusInfo.dart';

class VirusInfoService {
  // Get the total virus count globally today
  Future<GlobalVirusInfo> fetchGlobalVirusInfo() async {
    final response = await http.get(AppConstants.apiUrl + "all");

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      GlobalVirusInfo _globalVirusInfo = GlobalVirusInfo.fromJson(responseJson);
      return _globalVirusInfo;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<CountryInfo>> fetchAllCountriesVirusInfo() async {
    // Get virus info of all countries as a list
    final response =
        await http.get(AppConstants.apiUrl + "countries/?sort=cases");

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return (responseJson as List)
          .map((countryInfo) => CountryInfo.fromJson(countryInfo))
          .toList();
    } else {
      throw Exception('Failed to load countries data');
    }
  }
}
