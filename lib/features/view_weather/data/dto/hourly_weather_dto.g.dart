// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyWeatherDto _$HourlyWeatherDtoFromJson(Map<String, dynamic> json) =>
    HourlyWeatherDto(
      weather: WeatherDto.fromJson(json['weather'] as Map<String, dynamic>),
      windSpeed: (json['wind_spd'] as num).toDouble(),
      temperature: (json['temp'] as num).toDouble(),
      dateTime: DateTime.parse(json['timestamp_local'] as String),
      humidity: json['rh'] as int,
      visibility: (json['vis'] as num).toDouble(),
    );

Map<String, dynamic> _$HourlyWeatherDtoToJson(HourlyWeatherDto instance) =>
    <String, dynamic>{
      'weather': instance.weather.toJson(),
      'wind_spd': instance.windSpeed,
      'temp': instance.temperature,
      'timestamp_local': instance.dateTime.toIso8601String(),
      'rh': instance.humidity,
      'vis': instance.visibility,
    };
