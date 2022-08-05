import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/view_weather/data/dto/weather_dto.dart';
import 'package:weather_app/features/view_weather/domain/entities/hourly_weather.dart';

part 'hourly_weather_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class HourlyWeatherDto {
  final WeatherDto weather;
  @JsonKey(name: 'wind_spd')
  final double windSpeed;
  @JsonKey(name: 'temp')
  final int temperature;
  @JsonKey(name: 'datetime')
  final DateTime dateTime;
  @JsonKey(name: 'rh')
  final int humidity;
  @JsonKey(name: 'vis')
  final double visibility;

  const HourlyWeatherDto({
    required this.weather,
    required this.windSpeed,
    required this.temperature,
    required this.dateTime,
    required this.humidity,
    required this.visibility,
  });

  factory HourlyWeatherDto.fromJson(Map<String, dynamic> json) =>
      _$HourlyWeatherDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyWeatherDtoToJson(this);
}

extension HourlyWeatherMapper on HourlyWeatherDto {
  HourlyWeather toHourlyWeather() => HourlyWeather(
        weather: weather.toWeather(),
        windSpeed: windSpeed,
        temperature: temperature,
        dateTime: dateTime,
        humidity: humidity,
        visibility: visibility,
      );
}
