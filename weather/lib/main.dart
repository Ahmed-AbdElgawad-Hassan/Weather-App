import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/getWeatherCubit/Get_Weather_cubit.dart';
import 'package:weather/getWeatherCubit/Get_weather_states.dart';
import 'package:weather/views/StartView.dart';

void main() {
  runApp(const Weather());
}

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            GetWeatherCubit(weatherinitialState()), // required attribute
        child: Builder(
          builder: (BuildContext context) => MaterialApp(
            theme: ThemeData(
                useMaterial3: false, // عشان التغيير يسمع معايا
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.WeatherCondition),
                brightness: Brightness
                    .light // change the mode of App to light or dark mode
                ),
            debugShowCheckedModeBanner: false,
            home: const StartView(),
          ),
        ));
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blueGrey;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange; // MaterialColor
    case 'Partly cloudy':
      return Colors.blue; // MaterialColor
    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey; // MaterialColor
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey; // MaterialColor
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Patchy light rain':
    case 'Light rain shower':
      return Colors.lightBlue; // MaterialColor
    case 'Moderate rain':
    case 'Moderate rain at times':
    case 'Moderate or heavy rain shower':
      return Colors.blue; // MaterialColor
    case 'Heavy rain':
    case 'Heavy rain at times':
    case 'Torrential rain shower':
      return Colors.indigo; // MaterialColor
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Patchy light snow':
    case 'Light snow showers':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Moderate or heavy snow':
    case 'Moderate or heavy snow showers':
      return Colors.lightBlue; // MaterialColor
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy sleet showers':
      return Colors.blueGrey; // MaterialColor
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Moderate or heavy freezing rain':
      return Colors.cyan; // MaterialColor
    case 'Blizzard':
    case 'Blowing snow':
      return Colors
          .blueGrey; // MaterialColor (White is allowed as MaterialColor)
    case 'Thundery outbreaks possible':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple; // MaterialColor
    case 'Patchy light rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.purple; // MaterialColor
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.lightBlue; // MaterialColor
    case 'Patchy light drizzle':
    case 'Light drizzle':
      return Colors.teal; // MaterialColor
    default:
      return Colors.blueGrey; // Default MaterialColor for unknown conditions
  }
}
