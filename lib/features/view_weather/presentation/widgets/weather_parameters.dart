import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/custom_icons.dart';

class WeatherParameters extends StatelessWidget {
  const WeatherParameters({
    Key? key,
    required this.windSpeed,
    required this.humidity,
    required this.visibility,
  }) : super(key: key);

  final int windSpeed;
  final int humidity;
  final double visibility;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildWeatherItem(
          Icons.wind_power,
          '$windSpeed m/s',
          'Wind',
        ),
        const SizedBox(width: 20),
        _buildWeatherItem(
          CustomIcons.rainDrop,
          '$humidity %',
          'Humidity',
        ),
        const SizedBox(width: 20),
        _buildWeatherItem(
          Icons.visibility,
          '${visibility.toStringAsFixed(1)} km',
          'Visibility',
        )
      ],
    );
  }

  Widget _buildWeatherItem(
    IconData icon,
    String paramValue,
    String param,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        Text(
          paramValue,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Text(
          param,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
