import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_app/src/application/bloc/weather/weather_event.dart';
import 'package:weather_app/src/application/bloc/weather/weather_state.dart';

import '../../../core/usecases/read_weather_query.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final ReadWeatherQuery _readWeatherQuery;

  WeatherBloc(this._readWeatherQuery) : super(WeatherEmpty()) {
    on<OnCityChanged>(
      (event, emit) async {
        final cityName = event.cityName;

        emit(WeatherLoading());

        final result = await _readWeatherQuery.execute(cityName);

        result.fold(
          (failure) => emit(
            WeatherError(failure.message),
          ),
          (data) => emit(
            WeatherHasData(data),
          ),
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
