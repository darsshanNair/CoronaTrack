import 'package:covid_tracker/models/CountryInfo.dart';
import 'package:covid_tracker/models/CountryStats.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:covid_tracker/app/AppConstants.dart';
import 'package:covid_tracker/models/GlobalVirusInfo.dart';

class VirusInfoService {
  // Get the total virus count globally today
  Future<GlobalVirusInfo> fetchGlobalVirusInfo() async {
    final response = await http.get(AppConstants.lmaoApiUrl + "all");

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
        await http.get(AppConstants.lmaoApiUrl + "countries/?sort=cases");

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return (responseJson as List)
          .map((countryInfo) => CountryInfo.fromJson(countryInfo))
          .toList();
    } else {
      throw Exception('Failed to load countries data');
    }
  }

  Future<List<CountryStats>> fetchTotalCountryCasesByDateRange(
      String countryCode, CaseStatus status) async {
    final String statisticspiEnpoint =
        constructStatisticsApiEndpoint(status, countryCode);
    final response = await http.get(statisticspiEnpoint);

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return (responseJson as List)
          .map((countryInfo) => CountryStats.fromJson(countryInfo))
          .toList();
    } else {
      throw Exception('Failed to load countries data');
    }
  }

  String constructStatisticsApiEndpoint(CaseStatus status, String countryCode) {
    final todayDate = DateTime.now().toIso8601String();

    switch (status) {
      case CaseStatus.confirmed:
        return AppConstants.covid19Api +
            "country/$countryCode/status/confirmed?from=2020-12-12T00:00:00Z&to=$todayDate";

      case CaseStatus.recovered:
        return AppConstants.covid19Api +
            "country/$countryCode/status/recovered?from=2020-12-12T00:00:00Z&to=$todayDate";

      case CaseStatus.deaths:
        return AppConstants.covid19Api +
            "country/$countryCode/status/deaths?from=2020-12-12T00:00:00Z&to=$todayDate";

      default:
        return AppConstants.covid19Api +
            "country/$countryCode/status/deaths?from=2020-12-12T00:00:00Z&to=$todayDate";
    }
  }
}
