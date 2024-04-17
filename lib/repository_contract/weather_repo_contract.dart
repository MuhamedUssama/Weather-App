import 'package:weather_app/data/models/weather_model.dart';

abstract class WeatherRepositoryContracct {
  Future<List<WeatherModel>> getWeather(String city);
}
