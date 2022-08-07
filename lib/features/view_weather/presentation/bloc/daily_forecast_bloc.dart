import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/view_weather/domain/entities/daily_forecast.dart';
import 'package:weather_app/features/view_weather/domain/usecases/forecast_params.dart';
import 'package:weather_app/features/view_weather/domain/usecases/get_daily_forecast.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/base_forecast_bloc.dart';

class DailyForecastBloc extends BaseForecastBloc<DailyForecast> {
  final GetDailyForecast getDailyForecast;

  DailyForecastBloc({
    required super.localizationInfo,
    required super.context,
    required this.getDailyForecast,
  });

  @override
  Future<Either<Failure, DailyForecast>> getForecast(BuildContext context) {
    return getDailyForecast(ForecastParams(context: context));
  }
}
