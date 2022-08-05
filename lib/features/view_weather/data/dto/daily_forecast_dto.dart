import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/view_weather/data/dto/daily_weather_dto.dart';
import 'package:weather_app/features/view_weather/domain/entities/daily_forecast.dart';

part 'daily_forecast_dto.g.dart';

@JsonSerializable()
class DailyForecastDto {
  @JsonKey(name: 'city_name')
  final String cityName;
  @JsonKey(name: 'data')
  final List<DailyWeatherDto> dailyWeather;

  const DailyForecastDto({
    required this.cityName,
    required this.dailyWeather,
  });

  factory DailyForecastDto.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DailyForecastDtoToJson(this);
}

extension DailyForecastMapper on DailyForecastDto {
  DailyForecast toDailyForecast() => DailyForecast(
        cityName: cityName,
        dailyWeather: dailyWeather.map((e) => e.toDailyWeather()).toList(),
      );
}
