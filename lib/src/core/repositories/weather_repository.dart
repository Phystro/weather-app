import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> readWeatherQuery(String cityName);
}