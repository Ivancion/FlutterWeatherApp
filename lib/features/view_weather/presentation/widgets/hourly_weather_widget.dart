import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/date_formatter.dart';
import 'package:weather_app/core/utils/weather_image.dart';
import 'package:weather_app/features/view_weather/domain/entities/hourly_forecast.dart';
import 'package:weather_app/features/view_weather/presentation/navigation/navigation.dart';
import 'package:weather_app/features/view_weather/presentation/widgets/weather_parameters.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({
    Key? key,
    required this.loadDataAgain,
    required this.forecast,
    required this.selectedItem,
    required this.onItemPressed,
    required this.locale,
  }) : super(key: key);

  final void Function() loadDataAgain;
  final HourlyForecast forecast;
  final int selectedItem;
  final void Function(int index) onItemPressed;
  final String locale;

  @override
  Widget build(BuildContext context) {
    final item = forecast.hourlyWeather[selectedItem];
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHeader(forecast.cityName),
          const SizedBox(height: 20),
          _buildWeatherImage(item.weather.icon),
          _buildMainWeatherInfo(
            item.weather.description,
            item.temperature,
          ),
          WeatherParameters(
            windSpeed: item.windSpeed,
            humidity: item.humidity,
            visibility: item.visibility,
          ),
          const SizedBox(height: 20),
          _buildDateAndShowDailyForecastBtn(
            DateFormatter.formatDate(
              item.dateTime,
              DateFormat.MMMd(locale),
            ),
            context,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 160,
            child: ListView.separated(
              itemCount: forecast.hourlyWeather.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return _buildListViewItem(index);
              }),
              separatorBuilder: (context, index) {
                return const SizedBox(width: 15);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String cityName) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.location_on,
            color: Colors.black,
          ),
          onPressed: loadDataAgain,
        ),
        const SizedBox(width: 50),
        Text(
          cityName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherImage(String image) {
    return Image(
      image: WeatherImage.getWeatherImage(image),
      fit: BoxFit.fill,
      width: 150,
      height: 150,
    );
  }

  Widget _buildMainWeatherInfo(String description, int temp) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          description,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          '$temp°',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 80,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDateAndShowDailyForecastBtn(String date, BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final todayString = localizations.today;
    final nextDays = localizations.nextDays;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$todayString, $date', style: const TextStyle(fontSize: 18)),
        GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(NavigationRouteNames.dailyForecastScreen),
          child: Row(
            children: [
              Text(nextDays, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListViewItem(int index) {
    final item = forecast.hourlyWeather[index];
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => onItemPressed(index),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: index != selectedItem
              ? const Color.fromRGBO(204, 255, 255, 1)
              : const Color.fromRGBO(0, 230, 230, 1),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${item.temperature}°',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            Image(
              image: WeatherImage.getWeatherImage(item.weather.icon),
              height: 80,
              width: 80,
            ),
            Text(
              DateFormatter.formatDate(item.dateTime, DateFormat.Hm(locale)),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
