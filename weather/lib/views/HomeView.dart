// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/getWeatherCubit/Get_Weather_cubit.dart';
import 'package:weather/getWeatherCubit/Get_weather_states.dart';
import 'package:weather/views/SearchView.dart';
import 'package:weather/widgets/NoWeatherBody.dart';
import 'package:weather/widgets/WeatherInfoBody.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather Application',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Searchview();
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.white,
                ))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, weatherState>(
          builder: (context, state) {
            if (state is weatherinitialState) {
              return  const Noweatherbody();
            }
            else if(state is WaetherLoadedState)
            {
             
              return  Weatherinfobody(
                weather: state.weatherModel,
                weatherModel: state.weatherModel,
              );
            }
            else
            {
              return const Center(child:  Text('There was an error',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.red),));
            }
          },
        ));
  }
}
