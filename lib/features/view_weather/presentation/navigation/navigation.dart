import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/daily_forecast_bloc/hourly_forecast_bloc.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/daily_forecast_bloc/hourly_forecast_event.dart';
import 'package:weather_app/features/view_weather/presentation/screens/home_screen.dart';
import 'package:weather_app/injection_container.dart';

abstract class NavigationRouteNames {
  static const hourlyForecastScreen = 'hourly_forecast_screen';
  static const dailyForecastScreen = 'daily_forecast_screen';
  static const splashScreen = 'splash_screen';
}

class Navigation {
  final initialRoute = NavigationRouteNames.hourlyForecastScreen;
  final routes = {
    NavigationRouteNames.hourlyForecastScreen: (_) => BlocProvider(
          create: (context) => HourlyForecastBloc(
            getHourlyForecast: sl(),
            localizationInfo: sl(),
            context: context,
          )..add(LoadWeather()),
          child: const HomeScreen(),
        ),
  };
}
