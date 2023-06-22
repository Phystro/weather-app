import 'package:dartz/dartz.dart';
import 'package:weather_app/src/utils/failure.dart';
import 'package:weather_app/src/core/entities/weather.dart';
import 'package:weather_app/src/core/repositories/weather_repository.dart';

class ReadWeatherQuery {
  final WeatherRepository repository;

  ReadWeatherQuery(this.repository);

  Future<Either<Failure, Weather>> execute(String cityName) {
    return repository.readWeatherQuery(cityName);
  }
}