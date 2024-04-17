import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:weather_app/data/models/weather_model.dart';

@singleton
class ApiManager {
  static const String baseUrl = "api.weatherapi.com";
  static const String apiKey = "8f25f70db2b7455095a65059241604";

  Future<WeatherModel> getWeather(String city) async {
    Uri url = Uri.https(baseUrl, "v1/forecast.json", {
      "key": apiKey,
      "q": city,
    });

    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    var weatherResponce = WeatherModel.fromJson(json);
    return weatherResponce;
  }
}
