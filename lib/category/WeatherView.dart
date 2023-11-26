// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/cubit_get_weather/cubit_get_Weather.dart';
import 'package:weatherapp/models/weathermodel.dart';

class WeatherView extends StatelessWidget {
  final WeatherModel weathermodel;

  const WeatherView({super.key, required this.weathermodel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            weathermodel.cityname,
            style: const TextStyle(fontSize: 30, color: Colors.black),
          ),
          Text(
            " update at: ${weathermodel.date.hour}:${weathermodel.date.minute}",
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network('https:${weathermodel.img!}')),
              const Spacer(),
              Text(
                weathermodel.temp.toString(),
                style: const TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    "maxtemp:${weathermodel.maxtemp.round()}",
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    "mintemp: ${weathermodel.mintemp.round()}",
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              )
            ],
          ),
          Text(
            weathermodel.weathercondition,
            style: const TextStyle(
                fontSize: 40, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
