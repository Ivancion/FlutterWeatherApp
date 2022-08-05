// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeatherDto _$DailyWeatherDtoFromJson(Map<String, dynamic> json) =>
    DailyWeatherDto(
      weather: WeatherDto.fromJson(json['weather'] as Map<String, dynamic>),
      windSpeed: (json['wind_spd'] as num).toDouble(),
      maxTemp: json['max_temp'] as int,
      minTemp: json['min_temp'] as int,
      humidity: json['rh'] as int,
      visibility: (json['vis'] as num).toDouble(),
      dateTime: DateTime.parse(json['datetime'] as String),
    );

Map<String, dynamic> _$DailyWeatherDtoToJson(DailyWeatherDto instance) =>
    <String, dynamic>{
      'weather': instance.weather.toJson(),
      'wind_spd': instance.windSpeed,
      'max_temp': instance.maxTemp,
      'min_temp': instance.minTemp,
      'rh': instance.humidity,
      'vis': instance.visibility,
      'datetime': instance.dateTime.toIso8601String(),
    };
