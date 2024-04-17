import 'package:weather_app/data/models/weather_model.dart';

abstract class WeatherDataSourceContract {
  Future<List<WeatherModel>> getWeather(String city);
}
