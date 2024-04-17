import 'package:injectable/injectable.dart';
import 'package:weather_app/data/apis/api_manager.dart';
import 'package:weather_app/data/models/weather_model.dart';

import '../data_source_contract/weather_data_source_contract.dart';

@Injectable(as: WeatherDataSourceContract)
class WeatherDataSourceImpl implements WeatherDataSourceContract {
  ApiManager apiManager;

  @factoryMethod
  WeatherDataSourceImpl(this.apiManager);

  @override
  Future<Current?> getCurrentWeather(String city, String days) async {
    var responce = await apiManager.getWeather(city, days);
    return responce.current;
  }

  @override
  Future<Forecast?> getForecastWeather(String city, String days) async {
    var responce = await apiManager.getWeather(city, days);
    return responce.forecast;
  }

  @override
  Future<Location?> getWeatherLocation(String city, String days) async {
    var responce = await apiManager.getWeather(city, days);
    return responce.location;
  }
}
