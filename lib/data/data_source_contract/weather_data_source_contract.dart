import 'package:weather_app/data/models/weather_model.dart';

abstract class WeatherDataSourceContract {
  Future<Current?> getCurrentWeather(String city, String days);
  Future<Location?> getWeatherLocation(String city, String days);
  Future<Forecast?> getForecastWeather(String city, String days);
}
