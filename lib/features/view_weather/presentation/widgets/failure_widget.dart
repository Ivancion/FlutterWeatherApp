import 'package:flutter/material.dart';

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
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/no_weather.png',
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 20),
          const Text(
            'Oops, something went wrong...',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Reason is : $message',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text(
              'Try again',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
