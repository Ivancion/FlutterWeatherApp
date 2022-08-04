import 'package:equatable/equatable.dart';

class ForecastParams extends Equatable {
  final double lat;
  final double lon;

  const ForecastParams({
    required this.lat,
    required this.lon,
  });

  @override
  List<Object?> get props => [lat, lon];
}
