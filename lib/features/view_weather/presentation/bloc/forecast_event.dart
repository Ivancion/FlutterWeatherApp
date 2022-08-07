abstract class ForecastEvent {}

class LoadForecast extends ForecastEvent {}

class SelectOtherItem extends ForecastEvent {
  final int itemIndex;

  SelectOtherItem({required this.itemIndex});
}
