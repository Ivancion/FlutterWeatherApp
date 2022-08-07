import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/view_weather/domain/entities/hourly_forecast.dart';
import 'package:weather_app/features/view_weather/domain/usecases/forecast_params.dart';
import 'package:weather_app/features/view_weather/domain/usecases/get_hourly_forecast.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/base_forecast_bloc.dart';

class HourlyForecastBloc extends BaseForecastBloc<HourlyForecast> {
  final GetHourlyForecast getHourlyForecast;

  HourlyForecastBloc({
    required super.localizationInfo,
    required super.context,
    required this.getHourlyForecast,
  });

  @override
  Future<Either<Failure, HourlyForecast>> getForecast(BuildContext context) {
    return getHourlyForecast(ForecastParams(context: context));
  }
}
