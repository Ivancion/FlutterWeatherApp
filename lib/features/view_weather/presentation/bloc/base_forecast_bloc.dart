import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/localization/localization_info.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/forecast_event.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/forecast_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

abstract class BaseForecastBloc<T> extends Bloc<ForecastEvent, ForecastState> {
  final LocalizationInfo localizationInfo;
  final BuildContext context;

  String get locale => localizationInfo.getCurrentLocale(context);

  Future<Either<Failure, T>> getForecast(BuildContext context);

  BaseForecastBloc({
    required this.localizationInfo,
    required this.context,
  }) : super(Loading()) {
    on<ForecastEvent>((event, emit) async {
      if (event is LoadForecast) {
        emit(Loading());
        final forecastOrFailure = await getForecast(context);
        forecastOrFailure.fold(
          (failure) {
            emit(Error(message: _mapFailureToMessage(failure)));
          },
          (forecast) {
            emit(Loaded<T>(selectedItem: 0, forecast: forecast));
          },
        );
      } else if (event is SelectOtherItem) {
        final newState =
            (state as Loaded).copyWith(selectedItem: event.itemIndex);
        emit(newState);
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
