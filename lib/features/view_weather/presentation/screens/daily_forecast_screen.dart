import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/daily_forecast_bloc.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/forecast_event.dart';
import 'package:weather_app/features/view_weather/presentation/bloc/forecast_state.dart';
import 'package:weather_app/features/view_weather/presentation/widgets/daily_weather_widget.dart';
import 'package:weather_app/features/view_weather/presentation/widgets/failure_widget.dart';
import 'package:weather_app/features/view_weather/presentation/widgets/loading_widget.dart';

class DailyForecastScreen extends StatelessWidget {
  const DailyForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DailyForecastBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Next 7 Days',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: const Color.fromRGBO(102, 255, 255, 1),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: BlocBuilder<DailyForecastBloc, ForecastState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is Loading) {
            return const LoadingWidget();
          } else if (state is Error) {
            return FailureWidget(
              message: state.message,
              onPressed: () => bloc.add(LoadForecast()),
            );
          } else if (state is Loaded) {
            return DailyWeatherWidget(
              forecast: state.forecast,
              selectedItem: state.selectedItem,
              locale: bloc.locale,
              onItemPressed: (index) =>
                  bloc.add(SelectOtherItem(itemIndex: index)),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
