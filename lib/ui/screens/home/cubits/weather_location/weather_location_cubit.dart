import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/ui/screens/home/cubits/weather_location/weather_location_state.dart';

import '../../../../../repository_contract/weather_repo_contract.dart';

@injectable
class WeatherLocationViewModel extends Cubit<WeatherLoacationStates> {
  WeatherRepositoryContract weatherRepositoryContract;

  @factoryMethod
  WeatherLocationViewModel(this.weatherRepositoryContract)
      : super(LocationLoadingState());

  getWeatherLocation(String city, String days) async {
    emit(LocationLoadingState());
    try {
      var weatherLocation =
          await weatherRepositoryContract.getWeatherLocation(city, days);
      emit(LocationSuccessState(weatherLocation));
    } catch (e) {
      emit(LocationErrorState(e.toString()));
    }
  }
}
