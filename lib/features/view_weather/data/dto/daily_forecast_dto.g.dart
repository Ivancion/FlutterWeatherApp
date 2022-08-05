// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecastDto _$DailyForecastDtoFromJson(Map<String, dynamic> json) =>
    DailyForecastDto(
      cityName: json['city_name'] as String,
      dailyWeather: (json['data'] as List<dynamic>)
          .map((e) => DailyWeatherDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyForecastDtoToJson(DailyForecastDto instance) =>
    <String, dynamic>{
      'city_name': instance.cityName,
      'data': instance.dailyWeather,
    };
