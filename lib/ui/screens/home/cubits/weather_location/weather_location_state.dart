import 'package:weather_app/data/models/new_weather_model.dart';

abstract class WeatherLoacationStates {}

class LocationLoadingState extends WeatherLoacationStates {}

class LocationErrorState extends WeatherLoacationStates {
  String? message;
  LocationErrorState(this.message);
}

class LocationSuccessState extends WeatherLoacationStates {
  Location? location;
  LocationSuccessState(this.location);
}
