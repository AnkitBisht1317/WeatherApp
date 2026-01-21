// by the help of network provider we find raw data in string form
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WeatherDataProvider {
  late double temp;
  Future<String> getCurrentWeather(String cityName) async {
    try {
      final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'];
      final baseUrl = dotenv.env['BASE_URL'];

      final res = await http.get(
        Uri.parse("$baseUrl/forecast?q=$cityName,in&appid=$apiKey"),
      );
      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
