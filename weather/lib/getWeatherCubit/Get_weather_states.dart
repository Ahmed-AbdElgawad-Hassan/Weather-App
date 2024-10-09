// ignore_for_file: file_names, camel_case_types
import 'package:weather/models/Weather_model.dart';

class weatherinitialState extends weatherState {}
class WaetherLoadedState extends weatherState {
  final WeatherModel weatherModel;

  WaetherLoadedState( this.weatherModel);
}
class WeatherFailurState extends weatherState {

  final String errorMessage;

  WeatherFailurState(this.errorMessage);
  
}



class weatherState {}