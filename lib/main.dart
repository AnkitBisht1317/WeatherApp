import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapp/bloc/weather_bloc.dart';
import 'package:weatherapp/data/repository/weather_repository.dart';
import 'package:weatherapp/presentation/screen/weather_screen.dart';

import 'data/data_provider/weather_data_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(WeatherDataProvider()),
      child: BlocProvider(
        create: (context) => WeatherBloc(context.read<WeatherRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}




//OPEN_WEATHER_API_KEY=291fe3485c9dd59b8b3e8cb0c14d2032
//BASE_URL=https://api.openweathermap.org/data/2.5
//cityName = Delhi
