// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyForecastDto _$HourlyForecastDtoFromJson(Map<String, dynamic> json) =>
    HourlyForecastDto(
      cityName: json['city_name'] as String,
      hourWeather: (json['data'] as List<dynamic>)
          .map((e) => HourlyWeatherDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HourlyForecastDtoToJson(HourlyForecastDto instance) =>
    <String, dynamic>{
      'city_name': instance.cityName,
      'data': instance.hourWeather,
    };
