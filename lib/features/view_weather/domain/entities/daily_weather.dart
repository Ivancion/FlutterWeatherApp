import 'package:equatable/equatable.dart';
import 'package:weather_app/features/view_weather/domain/entities/weather.dart';

class DailyWeather extends Equatable {
  final Weather weather;
  final double windSpeed;
  final int maxTemp;
  final int minTemp;
  final int humidity;
  final double visibility;
  final DateTime dateTime;

  const DailyWeather({
    required this.weather,
    required this.windSpeed,
    required this.maxTemp,
    required this.minTemp,
    required this.humidity,
    required this.visibility,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [
        weather,
        windSpeed,
        maxTemp,
        minTemp,
        humidity,
        visibility,
        dateTime,
      ];
}
