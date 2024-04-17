import 'package:weather_app/data/models/new_weather_model.dart';

abstract class WeatherDataSourceContract {
  Future<Current?> getCurrentWeather(String city);
  Future<Location?> getWeatherLocation(String city);
  Future<Forecast?> getForecastWeather(String city);
}
