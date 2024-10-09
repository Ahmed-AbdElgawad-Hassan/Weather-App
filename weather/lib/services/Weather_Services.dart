// ignore_for_file: unused_local_variable, unused_catch_clause, body_might_complete_normally_nullable, file_names

import 'package:dio/dio.dart';
import 'package:weather/models/Weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '3bd56e8b94e54114bf4115604242309';
  WeatherServices({required this.dio});
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel =
          WeatherModel.fromJson(response.data); // send the jsonData to model

      return weatherModel;
    } on DioException catch (e) {
      // dio execption (statusCode)
      final errorMessage = e.response?.data['error']['message'] ??
          'oop there was an error  Try Later';
      throw Exception(errorMessage); // normall execption
   
    }}}

  