import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ForecastParams extends Equatable {
  final BuildContext context;

  const ForecastParams({required this.context});

  @override
  List<Object?> get props => [context];
}
