import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/utils/weather_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 107, 210, 222),
      appBar: AppBar(
        leading: const Icon(
          Icons.location_on,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Kyiv',
            style: GoogleFonts.josefinSans(color: Colors.black, fontSize: 25),
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 20),
            _BigWeatherImage(),
            SizedBox(height: 20),
            _WeatherInfoWidget(),
          ],
        ),
      ),
    );
  }
}

class _BigWeatherImage extends StatelessWidget {
  const _BigWeatherImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: WeatherIcon.getBigIcon(7),
      fit: BoxFit.fill,
      width: 100,
      height: 100,
    );
  }
}

class _WeatherInfoWidget extends StatelessWidget {
  const _WeatherInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Cloudy',
          style: GoogleFonts.josefinSans(
            color: Colors.black,
            fontSize: 20,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10),
        Text(
          '25°',
          style: GoogleFonts.josefinSans(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 80,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wind_power),
            const SizedBox(width: 5),
            Text(
              '8 km/h',
              style: GoogleFonts.josefinSans(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.cloud),
            const SizedBox(width: 5),
            Text(
              '50 %',
              style: GoogleFonts.josefinSans(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
