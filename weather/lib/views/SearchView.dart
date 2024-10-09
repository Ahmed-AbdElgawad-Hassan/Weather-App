// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/getWeatherCubit/Get_Weather_cubit.dart';


class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search City',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              // saving user input in value when user press correct sign
          var getWeatherCubit= BlocProvider.of<GetWeatherCubit>(context);    // getweathercubit is a variabel that contian object of getweathercubit
          getWeatherCubit.getweather(value);
              Navigator.pop(context);

            },
            style: const TextStyle(
                // style of the text that user write
                fontSize: 18,
                fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
                // the decoration of the text field
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                label: Text('Search'),
                hintText: 'Enter City Name',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.blue,
                  size: 25,
                )),
          ),
        ),
      ),
    );
  }
}

