import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String icon;
  final String description;

  const Weather({
    required this.icon,
    required this.description,
  });

  @override
  List<Object?> get props => [
        icon,
        description,
      ];
}
