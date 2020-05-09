class GlobalVirusInfo {
  final int cases;
  final int active;
  final int deaths;
  final int recovered;

  GlobalVirusInfo({this.cases, this.active, this.deaths, this.recovered});

  factory GlobalVirusInfo.fromJson(Map<String, dynamic> json) {
    return GlobalVirusInfo(
      cases: json['cases'],
      active: json['active'],
      deaths: json['deaths'],
      recovered: json['recovered'],
    );
  }
}
