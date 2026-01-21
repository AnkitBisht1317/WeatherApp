// which data we find by network provider it is convert this raw data into model

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapp/data/models/weather_model.dart';

import '../data_provider/weather_data_provider.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;
  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      final cityName = dotenv.env['cityName'];
      final weatherData = await weatherDataProvider.getCurrentWeather(
        cityName!,
      );
      final data = jsonDecode(weatherData);

      if (data['cod'] != "200") {
        throw 'An unexpected error occurred';
      }
      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
