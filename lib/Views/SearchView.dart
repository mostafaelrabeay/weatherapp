import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/cubit_get_weather/cubit_get_Weather.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search city'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetweatherCubit>(context);
              getWeatherCubit.getweather(cityname: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.search,
                size: 30,
              ),
              hintText: 'search city',
              hintStyle: const TextStyle(fontSize: 25),
              labelText: 'search',
              labelStyle: const TextStyle(fontSize: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// // globel var to used in home view
// WeatherModel? weatherModel;
