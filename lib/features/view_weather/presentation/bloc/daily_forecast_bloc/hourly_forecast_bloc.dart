import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/localization/localization_info.dart';
import 'package:weather_app/features/view_weather/domain/usecases/forecast_params.dart';
import 'package:weather_app/features/view_weather/domain/usecases/get_hourly_forecast.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/daily_forecast_bloc/hourly_forecast_event.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/daily_forecast_bloc/hourly_forecast_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class HourlyForecastBloc
    extends Bloc<HourlyForecastEvent, HourlyForecastState> {
  final GetHourlyForecast getHourlyForecast;
  final LocalizationInfo localizationInfo;
  final BuildContext context;

  String get locale => localizationInfo.getCurrentLocale(context);

  HourlyForecastBloc({
    required this.getHourlyForecast,
    required this.localizationInfo,
    required this.context,
  }) : super(Loading()) {
    on<HourlyForecastEvent>((event, emit) async {
      if (event is LoadWeather) {
        emit(Loading());
        final forecastOrFailure =
            await getHourlyForecast(ForecastParams(context: context));
        forecastOrFailure.fold(
          (failure) {
            emit(Error(message: _mapFailureToMessage(failure)));
          },
          (forecast) {
            emit(Loaded(selectedItem: 0, forecast: forecast));
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
