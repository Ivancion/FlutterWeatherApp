import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/view_weather/domain/entities/daily_forecast.dart';
import 'package:weather_app/features/view_weather/domain/entities/hourly_forecast.dart';

abstract class WeatherForecaseRepository {
  Future<Either<Failure, DailyForecast>> getDailyForecast(BuildContext context);

  Future<Either<Failure, HourlyForecast>> getHourlyForecast(
      BuildContext context);
}
