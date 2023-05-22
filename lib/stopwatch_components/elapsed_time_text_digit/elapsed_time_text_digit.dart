import 'package:flutter/material.dart';

class TimeDigit extends StatelessWidget {
  const TimeDigit({
    super.key,
    required this.text,
    required this.width,
  });
  final String text;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ElapsedTimeTextDigit extends StatelessWidget {
  const ElapsedTimeTextDigit({super.key, required this.elapsedTime});
  final Duration elapsedTime;
  @override
  Widget build(BuildContext context) {
    final minutes = elapsedTime.inMinutes % 60;
    final seconds = elapsedTime.inSeconds % 60;
    final hundreds = (elapsedTime.inMilliseconds / 10) % 100;
    final minutesStr = minutes.toString().padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');
    final hundredsStr = hundreds.toStringAsFixed(0).padLeft(2, '0');
    const digitWidth = 12.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeDigit(text: minutesStr.substring(0, 1), width: digitWidth),
        TimeDigit(text: minutesStr.substring(1, 2), width: digitWidth),
        const TimeDigit(text: ':', width: 6),
        TimeDigit(text: secondsStr.substring(0, 1), width: digitWidth),
        TimeDigit(text: secondsStr.substring(1, 2), width: digitWidth),
        const TimeDigit(text: ':', width: 6),
        TimeDigit(text: hundredsStr.substring(0, 1), width: digitWidth),
        TimeDigit(text: hundredsStr.substring(1, 2), width: digitWidth),
      ],
    );
  }
}
