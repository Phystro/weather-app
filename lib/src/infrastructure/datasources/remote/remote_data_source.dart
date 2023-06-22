import 'dart:convert';

import 'package:weather_app/src/core/models/weather_model.dart';

import 'package:http/http.dart' as http;
import 'package:weather_app/src/utils/exceptions.dart';

import '../../../utils/constants.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> readWeatherQuery(String cityName);
}

class RemoteDataSourceImplementation implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImplementation({required this.client});

  @override
  Future<WeatherModel> readWeatherQuery(String cityName) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
