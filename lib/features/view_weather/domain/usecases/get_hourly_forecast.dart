import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/view_weather/domain/entities/hourly_forecast.dart';
import 'package:weather_app/features/view_weather/domain/repositories/weather_forecast_repository.dart';
import 'package:weather_app/features/view_weather/domain/usecases/forecast_params.dart';

class GetHourlyForecast implements Usecase<HourlyForecast, ForecastParams> {
  final WeatherForecaseRepository forecaseRepository;

  GetHourlyForecast(this.forecaseRepository);

  @override
  Future<Either<Failure, HourlyForecast>> call(ForecastParams params) {
    return forecaseRepository.getHourlyForecast(params.context);
  }
}
