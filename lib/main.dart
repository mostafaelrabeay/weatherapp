import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Views/SplashView.dart';
import 'package:weatherapp/cubits/cubit_get_weather/cubit_get_Weather.dart';
import 'package:weatherapp/cubits/cubit_get_weather/get_weather_states.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetweatherCubit(WeatherInitialState()),
      child: BlocBuilder<GetweatherCubit, WeatherState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: getWeatherColor(
                    BlocProvider.of<GetweatherCubit>(context)
                        .model
                        ?.weathercondition)),
            debugShowCheckedModeBanner: false,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  } else {
    switch (condition) {
      case 'sunny':
      case 'clear':
        return Colors.orange;
      case 'cloudy':
      case 'overcast':
        return Colors.grey;
      case 'rain':
      case 'drizzle':
        return Colors.lightBlue;
      case 'snow':
      case 'sleet':
      case 'ice pellets':
      case 'fog':
      case 'mist':
      case 'freezing fog':
        return Colors.blueGrey;
      case 'thunder':
      case 'thundery outbreaks possible':
        return Colors.amber;
      case 'blizzard':
      case 'blowing snow':
      default:
        return Colors.grey;
    }
  }
}
