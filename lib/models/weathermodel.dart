class WeatherModel {
  final String cityname;
  final DateTime date;
  final String? img;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weathercondition;

  WeatherModel({
    required this.cityname,
    required this.date,
    this.img,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.weathercondition,
  });
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      img: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      cityname: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weathercondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
