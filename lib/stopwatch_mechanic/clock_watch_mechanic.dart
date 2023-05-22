import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatchpracticetenth/stopwatch_components/clock_hand/clock_hand.dart';
import 'package:stopwatchpracticetenth/stopwatch_components/elapsed_time_text_digit/elapsed_time_text_digit.dart';

class ClockWatchMechanic extends StatefulWidget {
  const ClockWatchMechanic({super.key, required this.radius});
  final double radius;
  @override
  State<ClockWatchMechanic> createState() => ClockWatchMechanicState();
}

class ClockWatchMechanicState extends State<ClockWatchMechanic>
    with SingleTickerProviderStateMixin {
  Duration _previouslyElapsedTime = Duration.zero;
  Duration _currentlyElapsedTime = Duration.zero;
  Duration get _elapsedTime => _previouslyElapsedTime + _currentlyElapsedTime;
  late final Ticker _ticker;

  @override
  void initState() {
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentlyElapsedTime = elapsed;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
  }

  void toggleRunning(bool isRunning) {
    setState(() {
      if (isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previouslyElapsedTime += _currentlyElapsedTime;
        _currentlyElapsedTime = Duration.zero;
      }
    });
  }

  void reset() {
    _ticker.stop();
    setState(() {
      _previouslyElapsedTime = Duration.zero;
      _currentlyElapsedTime = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: widget.radius,
          top: widget.radius,
          child: ClockHand(
            rotationZAngle: pi + (2 * pi / 60000) * _elapsedTime.inMilliseconds,
            handThickness: 2,
            handLength: widget.radius,
            color: Colors.orange,
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            top: widget.radius * 1.3,
            child: ElapsedTimeTextDigit(elapsedTime: _elapsedTime)),
      ],
    );
  }
}
