import 'package:equatable/equatable.dart';
import 'package:weather_app/features/view_weather/domain/entities/hourly_forecast.dart';

abstract class HourlyForecastState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends HourlyForecastState {}

class Loaded extends HourlyForecastState {
  final int selectedItem;
  final HourlyForecast forecast;

  Loaded({
    required this.selectedItem,
    required this.forecast,
  });

  Loaded copyWith({
    int? selectedItem,
    HourlyForecast? forecast,
  }) {
    return Loaded(
      selectedItem: selectedItem ?? this.selectedItem,
      forecast: forecast ?? this.forecast,
    );
  }

  @override
  List<Object?> get props => [selectedItem, forecast];
}

class Error extends HourlyForecastState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [message];
}
