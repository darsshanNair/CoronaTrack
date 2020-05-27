class Country {
  final int id;
  final String flag;
  final String countryCode;

  Country({
    this.id,
    this.flag,
    this.countryCode,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['_id'],
      flag: json['flag'],
      countryCode: json['iso2'],
    );
  }
}
