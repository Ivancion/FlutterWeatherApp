import 'dart:convert';

import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/features/view_weather/data/dto/daily_forecast_dto.dart';
import 'package:weather_app/features/view_weather/data/dto/hourly_forecast_dto.dart';
import 'package:http/http.dart' as http;

abstract class WeatherForecastRemoteDataSource {
  Future<DailyForecastDto> getDailyForecast(
      double lat, double lon, String lang);

  Future<HourlyForecastDto> getHourlyForecast(
      double lat, double lon, String lang);
}

class WeatherForecastRemoteDataSourceImpl
    implements WeatherForecastRemoteDataSource {
  final http.Client client;

  WeatherForecastRemoteDataSourceImpl({required this.client});

  @override
  Future<DailyForecastDto> getDailyForecast(
      double lat, double lon, String lang) async {
    final url = Uri.parse(
        'https://weatherbit-v1-mashape.p.rapidapi.com/forecast/daily?lat=$lat&lon=$lon&days=8&lang=$lang');

    final response = await client.get(
      url,
      headers: {
        'X-RapidAPI-Key': 'e01f6b41a4mshc2a1004f23ba7afp1a3447jsna5dd1449edba',
        'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final forecast = DailyForecastDto.fromJson(jsonDecode(response.body));
      forecast.dailyWeather.removeAt(0);
      return forecast;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<HourlyForecastDto> getHourlyForecast(
      double lat, double lon, String lang) async {
    final url = Uri.parse(
        'https://weatherbit-v1-mashape.p.rapidapi.com/forecast/hourly?lat=$lat&lon=$lon&hours=24&lang=$lang');

    final response = await client.get(
      url,
      headers: {
        'X-RapidAPI-Key': 'e01f6b41a4mshc2a1004f23ba7afp1a3447jsna5dd1449edba',
        'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      return HourlyForecastDto.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
