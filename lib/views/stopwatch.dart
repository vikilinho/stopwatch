// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch/views/elapsedtime_text.dart';
import 'package:stopwatch/views/reset_button.dart';
import 'package:stopwatch/views/start_stop_button.dart';
import 'package:stopwatch/views/stop_watch_renderer.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  Duration _currentlylapsed = Duration.zero;
  Duration _lastElapsed = Duration.zero;

  Duration get _elapsed => _lastElapsed + _currentlylapsed;

  late Ticker _ticker;
  bool isrunning = false;
  @override
  void initState() {
    _ticker = createTicker((Duration elapsed) {
      setState(() {
        _currentlylapsed = elapsed;
      });
    });

    super.initState();
  }

  void _startWatch() {
    setState(() {
      isrunning = !isrunning;
      if (isrunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _lastElapsed += _currentlylapsed;
        _currentlylapsed = Duration.zero;
      }
    });
  }

  void _resetWatch() {
    setState(() {
      isrunning = false;
      _ticker.stop();
      _lastElapsed = Duration.zero;
      _currentlylapsed = Duration.zero;
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final radius = constraints.maxWidth / 2;
      return Stack(
        children: [
          StopWatchRenderer(
            elapsed: _elapsed,
            radius: radius,
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 80,
                height: 80,
                child: ResetButton(
                  onPressed: () => _resetWatch(),
                ),
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80,
                height: 80,
                child: StartStopButton(
                  isRunning: isrunning,
                  onPressed: () => _startWatch(),
                ),
              )),
        ],
      );
    });
  }
}
