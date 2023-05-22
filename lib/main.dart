import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stopwatchpracticetenth/stopwatch_screen/stopwatch.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: AspectRatio(
                aspectRatio: 0.85,
                child: StopWatch(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
