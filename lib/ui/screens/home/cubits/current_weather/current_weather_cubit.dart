import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../repository_contract/weather_repo_contract.dart';
import 'current_weather_states.dart';

@injectable
class CurrentWeatherViewModel extends Cubit<CurrentWeatherStates> {
  WeatherRepositoryContract weatherRepositoryContract;

  @factoryMethod
  CurrentWeatherViewModel(this.weatherRepositoryContract)
      : super(LoadingState());

  getCurrentWeather(String city, String days) async {
    emit(LoadingState());

    try {
      var currentWeather =
          await weatherRepositoryContract.getCurrentWeather(city, days);
      emit(SuccessState(currentWeather));
    } catch (e) {
      emit(ErrorState(e.toString()));
      print(e.toString());
    }
  }
}
