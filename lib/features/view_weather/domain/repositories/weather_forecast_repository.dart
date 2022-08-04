import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/view_weather/domain/entities/daily_forecast.dart';
import 'package:weather_app/features/view_weather/domain/entities/hourly_forecast.dart';

abstract class WeatherForecaseRepository {
  Future<Either<Failure, DailyForecast>> getDailyForecast(
      double lat, double lon);

  Future<Either<Failure, HourlyForecast>> getHourlyForecast(
      double lat, double lon);
}
