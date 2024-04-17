import '../../../../../data/models/new_weather_model.dart';

sealed class CurrentWeatherStates {}

class LoadingState extends CurrentWeatherStates {}

class ErrorState extends CurrentWeatherStates {
  String? message;
  ErrorState(this.message);
}

class SuccessState extends CurrentWeatherStates {
  Current? current;
  SuccessState(this.current);
}
