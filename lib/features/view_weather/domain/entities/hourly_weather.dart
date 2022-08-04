import 'package:equatable/equatable.dart';

class HourlyWeather extends Equatable {
  final String icon;
  final String description;
  final double windSpeed;
  final int temperature;
  final DateTime dateTime;
  final int humidity;
  final double visibility;

  const HourlyWeather({
    required this.icon,
    required this.description,
    required this.windSpeed,
    required this.temperature,
    required this.dateTime,
    required this.humidity,
    required this.visibility,
  });

  @override
  List<Object?> get props => [
        icon,
        description,
        windSpeed,
        temperature,
        dateTime,
        humidity,
        visibility,
      ];
}
