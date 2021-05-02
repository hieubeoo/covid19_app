import 'package:covid19_app/models/ncov_19.dart';
import 'package:covid19_app/repositories/ncov19_api_client.dart';
import 'package:flutter/foundation.dart';

class Ncov19Repository {
  final Ncov19ApiClient ncov19apiClient;

  Ncov19Repository({@required this.ncov19apiClient});
  Future<Ncov19> getNcov19ByCountry(String country) async {
    return ncov19apiClient.fetNcov19ByCountry(country);
  }

  Future<Ncov19> getNcov19ByAll() async {
    return ncov19apiClient.fetNcov19All();
  }
}
