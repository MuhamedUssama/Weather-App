import 'package:injectable/injectable.dart';
import 'package:weather_app/data/data_source_contract/weather_data_source_contract.dart';
import 'package:weather_app/data/models/new_weather_model.dart';
import 'package:weather_app/repository_contract/weather_repo_contract.dart';

@Injectable(as: WeatherRepositoryContract)
class WeatherRepositoryImpl implements WeatherRepositoryContract {
  WeatherDataSourceContract weatherDataSourceContract;

  @factoryMethod
  WeatherRepositoryImpl(this.weatherDataSourceContract);

  @override
  Future<Current?> getCurrentWeather(String city, String days) {
    return weatherDataSourceContract.getCurrentWeather(city, days);
  }

  @override
  Future<Forecast?> getForecastWeather(String city, String days) {
    return weatherDataSourceContract.getForecastWeather(city, days);
  }

  @override
  Future<Location?> getWeatherLocation(String city, String days) {
    return weatherDataSourceContract.getWeatherLocation(city, days);
  }
}
