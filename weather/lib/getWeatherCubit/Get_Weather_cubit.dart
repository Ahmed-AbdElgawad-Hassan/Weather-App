// ignore_for_file: unused_catch_clause, file_names, avoid_types_as_parameter_names

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/Weather_model.dart';
import 'package:weather/services/Weather_Services.dart';

import 'Get_weather_states.dart';

class GetWeatherCubit extends Cubit<weatherState> {
  GetWeatherCubit(super.weatherinitialState);
  WeatherModel? weatherModel;

  dynamic getweather(String value) async {
    try {
      WeatherModel weatherModel = await WeatherServices(dio: Dio()).getCurrentWeather(cityName: value);
      emit(WaetherLoadedState(weatherModel));
    } on Exception catch (e) {
      emit(WeatherFailurState(e.toString()));
    }
  }
}
