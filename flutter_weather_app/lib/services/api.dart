import 'dart:convert';

import 'package:flutter_weather_app/models/city_model.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static const String apiBaseUrl = 'https://api.weatherapi.com/v1/current.json?key=36bf494189584b349f584611230806&q=';
  Future<CityInfo> getCityInfo(String cityName) async {
    final uri = Uri.parse(apiBaseUrl + cityName);
    final request = await http.get(uri);
    final jsonBody = jsonDecode(request.body);
    final cityInfo = CityInfo.fromJson(jsonBody);
    return cityInfo;
  }
}
