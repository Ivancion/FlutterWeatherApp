import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({
    Key? key,
    required this.message,
    required this.onPressed,
  }) : super(key: key);

  final String message;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final somethingWrong = localizations.somethingWrong;
    final reason = localizations.reason;
    final tryAgain = localizations.tryAgain;
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/no_weather.png',
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 20),
          Text(
            somethingWrong,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            '$reason : $message',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
              tryAgain,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
