import 'package:flutter/material.dart';
import 'package:stopwatchpracticetenth/stopwatch_components/buttons/reset_button.dart';
import 'package:stopwatchpracticetenth/stopwatch_components/buttons/start_stop_button.dart';
import 'package:stopwatchpracticetenth/stopwatch_components/clock_markers/clock_markers.dart';
import 'package:stopwatchpracticetenth/stopwatch_mechanic/clock_watch_mechanic.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  final _tickerKeyClockMechanic = GlobalKey<ClockWatchMechanicState>();
  bool _isRunning = false;

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;
    });
    _tickerKeyClockMechanic.currentState?.toggleRunning(_isRunning);
  }

  void _reset() {
    setState(() {
      _isRunning = false;
    });
    _tickerKeyClockMechanic.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final radius = constraint.maxWidth / 2;
        return Stack(
          children: [
            //Clock markers: non-ticker dependent UI
            ClockMarkers(radius: radius),
            //Clock mechanic: ticker dependent UI
            ClockWatchMechanic(key: _tickerKeyClockMechanic, radius: radius),
            //Reset button
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 80,
                height: 80,
                child: ResetButton(onPressed: _reset),
              ),
            ),
            //Start/Stop button
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80,
                height: 80,
                child: StartStopButton(
                    isRunning: _isRunning, onPressed: _toggleRunning),
              ),
            )
          ],
        );
      },
    );
  }
}
