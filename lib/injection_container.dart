import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/geolocation/geolocation_info.dart';
import 'package:weather_app/core/localization/localization_info.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/features/view_weather/data/data_sources/weather_forecast_local_data_source.dart';
import 'package:weather_app/features/view_weather/data/data_sources/weather_forecast_remote_data_source.dart';
import 'package:weather_app/features/view_weather/data/repositories/weather_forecast_repository_impl.dart';
import 'package:weather_app/features/view_weather/domain/repositories/weather_forecast_repository.dart';
import 'package:weather_app/features/view_weather/domain/usecases/get_daily_forecast.dart';
import 'package:weather_app/features/view_weather/domain/usecases/get_hourly_forecast.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/features/view_weather/presentation/navigation/navigation.dart';
import 'package:weather_app/main.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - View Weather
  //App
  sl.registerFactory(() => MyApp(navigation: sl()));

  //Bloc

  //Use cases
  sl.registerLazySingleton(() => GetHourlyForecast(sl()));
  sl.registerLazySingleton(() => GetDailyForecast(sl()));

  //Repository
  sl.registerLazySingleton<WeatherForecaseRepository>(
      () => WeatherForecastRepositoryImpl(
            geolocationInfo: sl(),
            localDataSource: sl(),
            remoteDataSource: sl(),
            localizationInfo: sl(),
            networkInfo: sl(),
          ));

  //Data sources
  sl.registerLazySingleton<WeatherForecastLocalDataSource>(
      () => WeatherForecastLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<WeatherForecastRemoteDataSource>(
      () => WeatherForecastRemoteDataSourceImpl(client: sl()));

  // Presentation
  sl.registerFactory(() => Navigation());

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => LocalizationInfo());
  sl.registerLazySingleton<GeolocationInfo>(() => GeolocationInfoImpl());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
