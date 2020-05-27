class CountryStats {
  final String countryName;
  final String status;
  final int casesCount;
  final DateTime date;

  CountryStats({this.countryName, this.status, this.casesCount, this.date});

  factory CountryStats.fromJson(Map<String, dynamic> json) {
    return CountryStats(
      countryName: json['Country'],
      status: json['Status'],
      casesCount: json['Cases'],
      date: DateTime.parse(json['Date']),
    );
  }
}

enum CaseStatus {
  confirmed,
  recovered,
  deaths,
}
