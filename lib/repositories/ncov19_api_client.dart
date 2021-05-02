import 'dart:convert';

import 'package:covid19_app/models/ncov_19.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/ncov_19.dart';

class Ncov19ApiClient {
  static const baseUrl = 'https://covid-api.mmediagroup.fr/v1/cases';
  final http.Client httpClient;

  Ncov19ApiClient({@required this.httpClient});
  Future<Ncov19> fetNcov19ByCountry(String country) async {
    final ncov19Url = '$baseUrl?country = $country';
    final ncov19Response = await this.httpClient.get(Uri.parse(ncov19Url));

    if (ncov19Response.statusCode != 200) {
      throw Exception('Lỗi truy cập');
    }
    final ncov19Json = jsonDecode(ncov19Response.body);
    return Ncov19.fromJson(ncov19Json);
  }

  Future<Ncov19> fetNcov19All() async {
    final ncov19Url = '$baseUrl';
    final ncov19Response = await this.httpClient.get(Uri.parse(ncov19Url));

    if (ncov19Response.statusCode != 200) {
      throw Exception('Lỗi truy cập');
    }
    final ncov19Json = jsonDecode(ncov19Response.body);
    return Ncov19.fromJson(ncov19Json);
  }
}
