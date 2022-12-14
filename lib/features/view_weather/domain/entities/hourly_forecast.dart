import 'package:equatable/equatable.dart';
import 'package:weather_app/features/view_weather/domain/entities/hourly_weather.dart';

class HourlyForecast extends Equatable {
  final String cityName;
  final List<HourlyWeather> hourlyWeather;

  const HourlyForecast({
    required this.cityName,
    required this.hourlyWeather,
  });

  @override
  List<Object?> get props => [cityName, hourlyWeather];
}
