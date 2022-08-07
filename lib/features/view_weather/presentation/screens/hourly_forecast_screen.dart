import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/forecast_event.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/forecast_state.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/hourly_forecast_bloc.dart';
import 'package:weather_app/features/view_weather/presentation/widgets/failure_widget.dart';
import 'package:weather_app/features/view_weather/presentation/widgets/hourly_weather_widget.dart';
import 'package:weather_app/features/view_weather/presentation/widgets/loading_widget.dart';

class HourlyForecastScreen extends StatelessWidget {
  const HourlyForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HourlyForecastBloc>();
    return Scaffold(
      body: BlocBuilder<HourlyForecastBloc, ForecastState>(
        builder: (context, state) {
          if (state is Loading) {
            return const LoadingWidget();
          } else if (state is Error) {
            return FailureWidget(
              message: state.message,
              onPressed: () => bloc.add(LoadForecast()),
            );
          } else if (state is Loaded) {
            return HourlyWeatherWidget(
              loadDataAgain: () => bloc.add(LoadForecast()),
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
