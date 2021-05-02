import 'package:equatable/equatable.dart';

class Ncov19 extends Equatable {
  final int confirmed;
  final int recovered;
  final int deaths;
  final String country;
  final int population;
  final String continent;
  final String capitalCity;
  final String updated;
  const Ncov19(
      {this.confirmed,
      this.recovered,
      this.deaths,
      this.country,
      this.population,
      this.continent,
      this.capitalCity,
      this.updated});

  @override
  // TODO: implement props
  List<Object> get props => [
        confirmed,
        recovered,
        deaths,
        country,
        population,
        continent,
        capitalCity,
        updated,
      ];
  static Ncov19 fromJson(dynamic json) {
    final allNcov19 = json['All'];
    return Ncov19(
        confirmed: allNcov19['confirmed'],
        recovered: allNcov19['recovered'],
        deaths: allNcov19['deaths'],
        country: allNcov19['country'],
        population: allNcov19['population'],
        continent: allNcov19['continent'],
        capitalCity: allNcov19['capital_city'],
        updated: allNcov19['updated']);
  }
}
