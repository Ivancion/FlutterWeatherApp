import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/custom_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final localizations = AppLocalizations.of(context)!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildWeatherItem(
          Icons.wind_power,
          '$windSpeed ${localizations.metersPerSecond}',
          localizations.wind,
        ),
        const SizedBox(width: 20),
        _buildWeatherItem(
          CustomIcons.rainDrop,
          '$humidity %',
          localizations.humidity,
        ),
        const SizedBox(width: 20),
        _buildWeatherItem(
          Icons.visibility,
          '${visibility.toStringAsFixed(1)} ${localizations.kilometer}',
          localizations.visibility,
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
