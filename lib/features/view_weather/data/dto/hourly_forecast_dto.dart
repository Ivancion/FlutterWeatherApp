import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/view_weather/data/dto/hourly_weather_dto.dart';
import 'package:weather_app/features/view_weather/domain/entities/hourly_forecast.dart';

part 'hourly_forecast_dto.g.dart';

@JsonSerializable()
class HourlyForecastDto {
  @JsonKey(name: 'city_name')
  final String cityName;
  @JsonKey(name: 'data')
  final List<HourlyWeatherDto> hourWeather;

  const HourlyForecastDto({
    required this.cityName,
    required this.hourWeather,
  });

  factory HourlyForecastDto.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyForecastDtoToJson(this);
}

extension HourlyForecastMapper on HourlyForecastDto {
  HourlyForecast toHourlyForecast() => HourlyForecast(
        cityName: cityName,
        hourlyWeather: hourWeather.map((e) => e.toHourlyWeather()).toList(),
      );
}
