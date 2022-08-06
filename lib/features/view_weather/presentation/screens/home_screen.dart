import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/daily_forecast_bloc/hourly_forecast_bloc.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/daily_forecast_bloc/hourly_forecast_event.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/daily_forecast_bloc/hourly_forecast_state.dart';
import 'package:weather_app/features/view_weather/presentation/widgets/failure_widget.dart';
import 'package:weather_app/features/view_weather/presentation/widgets/hourly_weather_widget.dart';
import 'package:weather_app/features/view_weather/presentation/widgets/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HourlyForecastBloc>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(102, 255, 255, 1),
      body: BlocBuilder<HourlyForecastBloc, HourlyForecastState>(
        builder: (context, state) {
          if (state is Loading) {
            return const LoadingWidget();
          } else if (state is Error) {
            return FailureWidget(
              message: state.message,
              onPressed: () => bloc.add(LoadWeather()),
            );
          } else if (state is Loaded) {
            return HourlyWeatherWidget(
              loadDataAgain: () => bloc.add(LoadWeather()),
              forecast: state.forecast,
              selectedItem: state.selectedItem,
              onItemPressed: (index) =>
                  bloc.add(SelectOtherItem(itemIndex: index)),
              locale: bloc.locale,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
