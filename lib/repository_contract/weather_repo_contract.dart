import 'package:weather_app/data/models/new_weather_model.dart';

abstract class WeatherRepositoryContract {
  Future<Current?> getCurrentWeather(String city, String days);
  Future<Location?> getWeatherLocation(String city, String days);
  Future<Forecast?> getForecastWeather(String city, String days);
}
