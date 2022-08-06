import 'package:flutter/material.dart';

class WeatherImage {
  static const _imagePath = 'assets/weather_icons/';

  static AssetImage getWeatherImage(String image) {
    return AssetImage('$_imagePath$image.png');
  }
}
