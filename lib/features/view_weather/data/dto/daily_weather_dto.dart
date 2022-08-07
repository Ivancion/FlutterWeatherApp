import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/view_weather/data/dto/weather_dto.dart';
import 'package:weather_app/features/view_weather/domain/entities/daily_weather.dart';

part 'daily_weather_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class DailyWeatherDto {
  final WeatherDto weather;
  @JsonKey(name: 'wind_spd')
  final double windSpeed;
  @JsonKey(name: 'max_temp')
  final double maxTemp;
  @JsonKey(name: 'min_temp')
  final double minTemp;
  @JsonKey(name: 'rh')
  final int humidity;
  @JsonKey(name: 'vis')
  final double visibility;
  @JsonKey(name: 'datetime')
  final DateTime dateTime;

  const DailyWeatherDto({
    required this.weather,
    required this.windSpeed,
    required this.maxTemp,
    required this.minTemp,
    required this.humidity,
    required this.visibility,
    required this.dateTime,
  });

  factory DailyWeatherDto.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherDtoToJson(this);
}

extension DailyWeatherMapper on DailyWeatherDto {
  DailyWeather toDailyWeather() => DailyWeather(
        weather: weather.toWeather(),
        windSpeed: windSpeed.toInt(),
        maxTemp: maxTemp.toInt(),
        minTemp: minTemp.toInt(),
        humidity: humidity,
        visibility: visibility,
        dateTime: dateTime,
      );
}
