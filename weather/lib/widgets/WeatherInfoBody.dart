// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:weather/main.dart';
import 'package:weather/models/Weather_model.dart';

class Weatherinfobody extends StatelessWidget {
  const Weatherinfobody({super.key,required this.weatherModel, required this.weather});
  final WeatherModel weatherModel ;
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
             getThemeColor(weatherModel.WeatherCondition),   // function
             getThemeColor(weatherModel.WeatherCondition)[300]!,
             getThemeColor(weatherModel.WeatherCondition)[50]!
            ]

            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "updated at ${StringToDateTime(weatherModel.date).hour}:${StringToDateTime(weatherModel.date).minute} ",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
             const  SizedBox(
                height: 35,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(image: NetworkImage(
                    'https:${weatherModel.image!}'
                  )),
                  Text(
                    weatherModel.temp.round().toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                   Column(
                children: [
                 Text(
                   " MaxTemp ${weatherModel.maxtemp.round().toString()}",
                    style:const  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                   Text(
                    " MinTemp ${weatherModel.mintemp.round().toString()}",
                    style:const  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
                ],
              ),
             const  SizedBox(
                height: 32,
              ),
               Text(weatherModel.WeatherCondition,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),)
             
            ],
          ),
        ),
      ),
    );
  }

}

DateTime StringToDateTime(String value)
{
  return DateTime.parse(value);
  }
