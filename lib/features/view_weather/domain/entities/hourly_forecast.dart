import 'package:equatable/equatable.dart';
import 'package:weather_app/features/view_weather/domain/entities/hourly_weather.dart';

class HourlyForecast extends Equatable {
  final String cityName;
  final List<HourlyWeather> hourWeather;

  const HourlyForecast({
    required this.cityName,
    required this.hourWeather,
  });

  @override
  List<Object?> get props => [cityName, hourWeather];
}
