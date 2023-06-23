import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/src/injection.dart' as di;
import 'package:weather_app/src/presentation/pages/weather_page.dart';

import 'application/bloc/weather/weather_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<WeatherBloc>(),
        ),
      ],
      child: MaterialApp(
        title: "Weather App",
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        darkTheme: ThemeData.dark(),
        home: const WeatherPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}