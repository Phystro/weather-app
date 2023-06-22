import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/entities/weather.dart';
import 'package:weather_app/src/core/repositories/weather_repository.dart';
import 'package:weather_app/src/utils/exceptions.dart';
import 'package:weather_app/src/utils/failure.dart';

import '../datasources/remote/remote_data_source.dart';

class WeatherRepositoryImplementation implements WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepositoryImplementation({required this.remoteDataSource});

  @override
  Future<Either<Failure, Weather>> readWeatherQuery(String cityName) async {
    try {
      final result = await remoteDataSource.readWeatherQuery(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure("Failed to connect to the network!"));
    }
  }
}
