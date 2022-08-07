import 'package:equatable/equatable.dart';

abstract class ForecastState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends ForecastState {}

class Loaded<T> extends ForecastState {
  final int selectedItem;
  final T forecast;

  Loaded({
    required this.selectedItem,
    required this.forecast,
  });

  Loaded copyWith({
    int? selectedItem,
    T? forecast,
  }) {
    return Loaded(
      selectedItem: selectedItem ?? this.selectedItem,
      forecast: forecast ?? this.forecast,
    );
  }

  @override
  List<Object?> get props => [selectedItem, forecast];
}

class Error extends ForecastState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [message];
}
