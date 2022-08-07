import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/features/view_weather/presentation/navigation/navigation.dart';
import 'injection_container.dart' as di;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(di.sl<MyApp>()));
}

class MyApp extends StatelessWidget {
  final Navigation navigation;
  const MyApp({Key? key, required this.navigation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Arvo',
        scaffoldBackgroundColor: const Color.fromRGBO(102, 255, 255, 1),
      ),
      routes: navigation.routes,
      initialRoute: navigation.initialRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
