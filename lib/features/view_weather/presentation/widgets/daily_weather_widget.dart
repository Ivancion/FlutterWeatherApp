import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/date_formatter.dart';
import 'package:weather_app/core/utils/weather_image.dart';
import 'package:weather_app/features/view_weather/domain/entities/daily_forecast.dart';
import 'package:weather_app/features/view_weather/presentation/widgets/weather_parameters.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({
    Key? key,
    required this.forecast,
    required this.selectedItem,
    required this.locale,
    required this.onItemPressed,
  }) : super(key: key);

  final DailyForecast forecast;
  final int selectedItem;
  final void Function(int index) onItemPressed;
  final String locale;

  @override
  Widget build(BuildContext context) {
    final item = forecast.dailyWeather[selectedItem];
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMainWeatherInfo(
              item.dateTime,
              item.weather.icon,
              item.minTemp,
              item.maxTemp,
              item.weather.description,
            ),
            const SizedBox(height: 16),
            WeatherParameters(
              windSpeed: item.windSpeed,
              humidity: item.humidity,
              visibility: item.visibility,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: forecast.dailyWeather.length,
                itemBuilder: ((context, index) {
                  return _buildListItem(index);
                }),
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 5);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainWeatherInfo(
    DateTime date,
    String icon,
    int minTemp,
    int maxTemp,
    String description,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          DateFormatter.formatDate(date, DateFormat.MMMEd(locale)),
          style: const TextStyle(fontSize: 22),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: WeatherImage.getWeatherImage(icon),
              fit: BoxFit.fitWidth,
              width: 150,
              height: 150,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: '$minTemp',
                    style: const TextStyle(
                      fontSize: 60,
                      color: Colors.black,
                      fontFamily: 'Arvo',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '/$maxTemp°',
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'Arvo',
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      description,
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _buildListItem(int index) {
    final item = forecast.dailyWeather[index];
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => onItemPressed(index),
      child: Container(
        height: 60,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: index != selectedItem
              ? const Color.fromRGBO(204, 255, 255, 1)
              : const Color.fromRGBO(0, 230, 230, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormatter.formatDate(item.dateTime, DateFormat.E(locale)),
              style: const TextStyle(fontSize: 16),
            ),
            Image(
              image: WeatherImage.getWeatherImage(item.weather.icon),
              height: 80,
              width: 80,
            ),
            Text(
              '${item.minTemp}/${item.maxTemp}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
