import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/view_weather/domain/entities/daily_forecast.dart';
import 'package:weather_app/features/view_weather/domain/repositories/weather_forecast_repository.dart';
import 'package:weather_app/features/view_weather/domain/usecases/forecast_params.dart';

class GetDailyForecast implements Usecase<DailyForecast, ForecastParams> {
  final WeatherForecaseRepository forecaseRepository;

  GetDailyForecast(this.forecaseRepository);

  @override
  Future<Either<Failure, DailyForecast>> call(ForecastParams params) {
    return forecaseRepository.getDailyForecast(params.context);
  }
}
