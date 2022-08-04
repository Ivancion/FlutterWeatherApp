import 'package:equatable/equatable.dart';

import 'package:weather_app/features/view_weather/domain/entities/daily_weather.dart';

class DailyForecast extends Equatable {
  final String cityName;
  final List<DailyWeather> dailyWeather;

  const DailyForecast({
    required this.cityName,
    required this.dailyWeather,
  });

  @override
  List<Object?> get props => [
        cityName,
        dailyWeather,
      ];
}
