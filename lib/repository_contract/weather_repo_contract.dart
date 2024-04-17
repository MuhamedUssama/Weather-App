import 'package:weather_app/data/models/new_weather_model.dart';

abstract class WeatherRepositoryContract {
  Future<Current?> getCurrentWeather(String city);
  Future<Location?> getWeatherLocation(String city);
  Future<Forecast?> getForecastWeather(String city);
}
