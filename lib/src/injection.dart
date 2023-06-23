import 'package:get_it/get_it.dart';
import 'package:weather_app/src/application/bloc/weather/weather_bloc.dart';
import 'package:weather_app/src/core/repositories/weather_repository.dart';
import 'package:weather_app/src/core/usecases/read_weather_query.dart';
import 'package:weather_app/src/infrastructure/datasources/remote/remote_data_source.dart';
import 'package:weather_app/src/infrastructure/repositories/weather_repository_implementation.dart';

import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => WeatherBloc(locator()));

  // use case
  locator.registerLazySingleton(() => ReadWeatherQuery(locator()));

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImplementation(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImplementation(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
