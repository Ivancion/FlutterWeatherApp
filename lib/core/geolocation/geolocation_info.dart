import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/geolocation/geolocation_position.dart';

abstract class GeolocationInfo {
  Future<GeolocationPosition> getCurrentLocation();
}

class GeolocationInfoImpl implements GeolocationInfo {
  @override
  Future<GeolocationPosition> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      ).timeout(const Duration(seconds: 5));

      return GeolocationPosition(
        lat: position.latitude,
        lon: position.longitude,
      );
    } catch (e) {
      // This [GeolocationPosition] is position of Kiev, which will be by default

      return GeolocationPosition(
        lat: 50.45,
        lon: 30.52,
      );
    }
  }
}
