import 'dart:convert';

class HourlyForecast {
  final DateTime time;
  final double temp;
  final String sky;

  HourlyForecast({required this.time, required this.temp, required this.sky});

  factory HourlyForecast.fromMap(Map<String, dynamic> map) {
    return HourlyForecast(
      time: DateTime.parse(map['dt_txt']),
      temp: (map['main']['temp'] as num).toDouble(),
      sky: map['weather'][0]['main'],
    );
  }
}

class WeatherModel {
  final double currentTemp;
  final String currentSky;
  final double currentPressure;
  final double currentWindSpeed;
  final double currentHumidity;
  final List<HourlyForecast> hourlyForecasts;

  WeatherModel({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.hourlyForecasts,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];

    final hourlyList = (map['list'] as List)
        .skip(1)
        .take(8)
        .map((e) => HourlyForecast.fromMap(e))
        .toList();

    return WeatherModel(
      currentTemp: (currentWeatherData['main']['temp'] as num).toDouble(),
      currentSky: currentWeatherData['weather'][0]['main'],
      currentPressure: (currentWeatherData['main']['pressure'] as num)
          .toDouble(),
      currentWindSpeed: (currentWeatherData['wind']['speed'] as num).toDouble(),
      currentHumidity: (currentWeatherData['main']['humidity'] as num)
          .toDouble(),
      hourlyForecasts: hourlyList,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'currentTemp': currentTemp,
      'currentSky': currentSky,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
    };
  }
}
