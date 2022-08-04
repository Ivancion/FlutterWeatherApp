// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DailyWeather extends Equatable {
  final String icon;
  final String description;
  final double windSpeed;
  final int maxTemp;
  final int minTemp;
  final int humidity;
  final double visibility;
  final DateTime dateTime;

  const DailyWeather({
    required this.icon,
    required this.description,
    required this.windSpeed,
    required this.maxTemp,
    required this.minTemp,
    required this.humidity,
    required this.visibility,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [
        icon,
        description,
        windSpeed,
        maxTemp,
        minTemp,
        humidity,
        visibility,
        dateTime,
      ];
}
