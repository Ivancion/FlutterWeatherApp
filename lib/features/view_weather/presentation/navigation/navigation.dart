import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/daily_forecast_bloc.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/forecast_event.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/hourly_forecast_bloc.dart';
import 'package:weather_app/features/view_weather/presentation/screens/daily_forecast_screen.dart';
import 'package:weather_app/features/view_weather/presentation/screens/hourly_forecast_screen.dart';
import 'package:weather_app/injection_container.dart';

abstract class NavigationRouteNames {
  static const hourlyForecastScreen = 'hourly_forecast_screen';
  static const dailyForecastScreen = 'daily_forecast_screen';
  static const splashScreen = 'splash_screen';
}

class Navigation {
  final initialRoute = NavigationRouteNames.hourlyForecastScreen;
  final routes = {
    NavigationRouteNames.hourlyForecastScreen: (_) =>
        BlocProvider<HourlyForecastBloc>(
          create: (context) => HourlyForecastBloc(
            getHourlyForecast: sl(),
            localizationInfo: sl(),
            context: context,
          )..add(LoadForecast()),
          child: const HourlyForecastScreen(),
        ),
    NavigationRouteNames.dailyForecastScreen: (_) =>
        BlocProvider<DailyForecastBloc>(
          create: (context) => DailyForecastBloc(
            getDailyForecast: sl(),
            localizationInfo: sl(),
            context: context,
          )..add(LoadForecast()),
          child: const DailyForecastScreen(),
        ),
  };
}
