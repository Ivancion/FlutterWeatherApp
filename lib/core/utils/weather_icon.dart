import 'package:flutter/material.dart';

class WeatherIcon {
  static const _mediumIconPath = 'assets/medium_weather_icons/';
  static const _bigIconPath = 'assets/big_weather_icons/';

  static AssetImage getMediumIcon(int iconNumber) {
    return AssetImage('$_mediumIconPath$iconNumber.png');
  }

  static AssetImage getBigIcon(int iconNumber) {
    return AssetImage('$_bigIconPath$iconNumber.png');
  }
}
