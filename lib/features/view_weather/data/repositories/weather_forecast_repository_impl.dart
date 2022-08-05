import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/error/exceptions.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/geolocation/geolocation_info.dart';
import 'package:weather_app/core/localization/localization_info.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/features/view_weather/data/data_sources/weather_forecast_local_data_source.dart';
import 'package:weather_app/features/view_weather/data/data_sources/weather_forecast_remote_data_source.dart';
import 'package:weather_app/features/view_weather/data/dto/daily_forecast_dto.dart';
import 'package:weather_app/features/view_weather/data/dto/hourly_forecast_dto.dart';
import 'package:weather_app/features/view_weather/domain/entities/daily_forecast.dart';
import 'package:weather_app/features/view_weather/domain/entities/hourly_forecast.dart';
import 'package:weather_app/features/view_weather/domain/repositories/weather_forecast_repository.dart';

class WeatherForecastRepositoryImpl implements WeatherForecaseRepository {
  final WeatherForecastLocalDataSource localDataSource;
  final WeatherForecastRemoteDataSource remoteDataSource;
  final GeolocationInfo geolocationInfo;
  final LocalizationInfo localizationInfo;
  final NetworkInfo networkInfo;

  const WeatherForecastRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.geolocationInfo,
    required this.localizationInfo,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, DailyForecast>> getDailyForecast(
      BuildContext context) async {
    if (await networkInfo.isConnected) {
      try {
        final locale = localizationInfo.getCurrentLocale(context);
        final geoPosition = await geolocationInfo.getCurrentLocation();
        final dailyForecast = await remoteDataSource.getDailyForecast(
          geoPosition.lat,
          geoPosition.lon,
          locale,
        );
        localDataSource.cacheDailyForecast(dailyForecast);
        return Right(dailyForecast.toDailyForecast());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final dailyForecast = await localDataSource.getLastDailyForecast();
        return Right(dailyForecast.toDailyForecast());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, HourlyForecast>> getHourlyForecast(
      BuildContext context) async {
    if (await networkInfo.isConnected) {
      try {
        final locale = localizationInfo.getCurrentLocale(context);
        final geoPosition = await geolocationInfo.getCurrentLocation();
        final hourlyForecast = await remoteDataSource.getHourlyForecast(
          geoPosition.lat,
          geoPosition.lon,
          locale,
        );
        localDataSource.cacheHourlyForecast(hourlyForecast);
        return Right(hourlyForecast.toHourlyForecast());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final hourlyForecast = await localDataSource.getLastHourlyForecast();
        return Right(hourlyForecast.toHourlyForecast());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
