class CountryModel{
  String name;
  String region;
  String subregion;
  String? capital;
  int population;
  String flag;
  List<dynamic>? borders;

  CountryModel({
    required this.name,
    required this.region,
    required this.subregion,
    required this.capital,
    required this.population,
    required this.flag,
    this.borders,
  });
  static CountryModel fromJSON(Map<String,dynamic>map){
    return CountryModel(
      name: map['name'],
      region: map['region'],
      subregion: map['subregion'],
      capital: map['capital'],
      population: map['population'],
      flag: map['flag'],
      borders: map['borders'],
    );
  }
}