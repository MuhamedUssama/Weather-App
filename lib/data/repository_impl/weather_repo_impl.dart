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
  Future<Current?> getCurrentWeather(String city) {
    return weatherDataSourceContract.getCurrentWeather(city);
  }

  @override
  Future<Forecast?> getForecastWeather(String city) {
    return weatherDataSourceContract.getForecastWeather(city);
  }

  @override
  Future<Location?> getWeatherLocation(String city) {
    return weatherDataSourceContract.getWeatherLocation(city);
  }
}
