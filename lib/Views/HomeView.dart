import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Views/SearchView.dart';
import 'package:weatherapp/category/NoWeatherView.dart';
import 'package:weatherapp/category/WeatherView.dart';
import 'package:weatherapp/cubits/cubit_get_weather/cubit_get_Weather.dart';
import 'package:weatherapp/cubits/cubit_get_weather/get_weather_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
        title: const Text(
          'Weather App  🌧️  ',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchView(),
                    ));
              },
              icon: const Icon(
                Icons.search,
                size: 35,
              ))
        ],
      ),
      body: BlocBuilder<GetweatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherView();
          } else if (state is WeatherLoadedState) {
            return WeatherView(
              weathermodel: state.weatherModel,
            );
          } else {
            return const Text('oops there is an error');
          }
        },
      ),
    );
  }
}
