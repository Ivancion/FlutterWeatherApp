import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/geolocation/geolocation_position.dart';

abstract class GeolocationInfo {
  Future<GeolocationPosition> getCurrentLocation();
}

class GeolocationInfoImpl implements GeolocationInfo {
  @override
  Future<GeolocationPosition> getCurrentLocation() async {
    LocationPermission permission;
    try {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception();
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception();
      }

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
