import 'package:equatable/equatable.dart';
import 'package:weather_app/features/view_weather/domain/entities/weather.dart';

class HourlyWeather extends Equatable {
  final Weather weather;
  final double windSpeed;
  final int temperature;
  final DateTime dateTime;
  final int humidity;
  final double visibility;

  const HourlyWeather({
    required this.weather,
    required this.windSpeed,
    required this.temperature,
    required this.dateTime,
    required this.humidity,
    required this.visibility,
  });

  @override
  List<Object?> get props => [
        weather,
        windSpeed,
        temperature,
        dateTime,
        humidity,
        visibility,
      ];
}
