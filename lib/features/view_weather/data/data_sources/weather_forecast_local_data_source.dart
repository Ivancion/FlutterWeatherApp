import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/features/view_weather/data/dto/daily_forecast_dto.dart';
import 'package:weather_app/features/view_weather/data/dto/hourly_forecast_dto.dart';

abstract class WeatherForecastLocalDataSource {
  Future<DailyForecastDto> getLastDailyForecast();
  Future<HourlyForecastDto> getLastHourlyForecast();

  Future<void> cacheDailyForecast(DailyForecastDto dailyForecast);
  Future<void> cacheHourlyForecast(HourlyForecastDto hourlyForecast);
}

const cachedDailyForecast = 'CACHED_DAILY_FORECAST';
const cachedHourlyForecast = 'CACHED_HOURLY_FORECAST';

class WeatherForecastLocalDataSourceImpl
    implements WeatherForecastLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherForecastLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheDailyForecast(DailyForecastDto dailyForecast) {
    return sharedPreferences.setString(
      cachedDailyForecast,
      json.encode(dailyForecast.toJson()),
    );
  }

  @override
  Future<void> cacheHourlyForecast(HourlyForecastDto hourlyForecast) {
    return sharedPreferences.setString(
      cachedHourlyForecast,
      json.encode(hourlyForecast.toJson()),
    );
  }

  @override
  Future<DailyForecastDto> getLastDailyForecast() {
    final jsonString = sharedPreferences.getString(cachedDailyForecast);
    if (jsonString != null) {
      return Future.value(DailyForecastDto.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<HourlyForecastDto> getLastHourlyForecast() {
    final jsonString = sharedPreferences.getString(cachedHourlyForecast);
    if (jsonString != null) {
      return Future.value(HourlyForecastDto.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
