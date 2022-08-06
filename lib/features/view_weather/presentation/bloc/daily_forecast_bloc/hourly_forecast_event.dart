abstract class HourlyForecastEvent {}

class LoadWeather extends HourlyForecastEvent {}

class SelectOtherItem extends HourlyForecastEvent {
  final int itemIndex;

  SelectOtherItem({required this.itemIndex});
}
