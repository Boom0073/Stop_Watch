import 'package:flutter/material.dart';
import 'package:stopwatchpracticetenth/stopwatch_components/clock_markers/seconds_tick_and_text_marker.dart';

class ClockMarkers extends StatelessWidget {
  const ClockMarkers({super.key, required this.radius});
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
            left: radius,
            top: radius,
            child: ClockSecondsTickMarker(second: i, radius: radius),
          ),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
            left: radius,
            top: radius,
            child: ClockTextMarker(value: i, maxValue: 60, radius: radius),
          ),
      ],
    );
  }
}
