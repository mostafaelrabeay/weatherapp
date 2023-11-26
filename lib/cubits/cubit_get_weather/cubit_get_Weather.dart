// ignore_for_file: file_names

import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/cubit_get_weather/get_weather_states.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/servises/WeatherSerivises.dart';

class GetweatherCubit extends Cubit<WeatherState> {
  WeatherModel? model;
  GetweatherCubit(super.WeatherInitialState);

  getweather({required String cityname}) async {
    try {
      WeatherModel weatherModel =
          await WeatherServises(dio: Dio()).getweather(cityname: cityname);
      emit(WeatherLoadedState(weatherModel: weatherModel));
    } on Exception catch (e) {
      emit(WeatherFailurState());
    }
  }
}
