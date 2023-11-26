// ignore_for_file: file_names

import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:weatherapp/models/weathermodel.dart';

class WeatherServises {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '2f150855ef2048899f210757231411';
  WeatherServises({required this.dio});
  Future<WeatherModel> getweather({required String cityname}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityname&days=1');
      WeatherModel model = WeatherModel.fromjson(response.data);
      return model;
    } on DioException catch (e) {
      final String errormasege = e.response?.data['error']['message'] ??
          'oops there was an error ,try again later';
      throw Exception(errormasege);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error ,try again later');
    }
  }
}
