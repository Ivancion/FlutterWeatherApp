import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/view_weather/domain/entities/weather.dart';

part 'weather_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherDto {
  final String icon;
  final String description;

  WeatherDto({
    required this.icon,
    required this.description,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);
}

extension WeatherMapper on WeatherDto {
  Weather toWeather() => Weather(
        icon: icon,
        description: description,
      );
}
