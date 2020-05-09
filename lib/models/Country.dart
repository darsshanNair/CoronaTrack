class Country {
  final int id;
  final String flag;

  Country({this.id, this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['_id'],
      flag: json['flag'],
    );
  }
}
