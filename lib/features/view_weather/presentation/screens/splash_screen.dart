import 'package:flutter/material.dart';
import 'package:weather_app/features/view_weather/presentation/navigation/navigation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((_) => Navigator.of(context)
        .pushNamed(NavigationRouteNames.hourlyForecastScreen));
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/splash_logo.png'),
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
