import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch/views/clock_hand.dart';
import 'package:stopwatch/views/clockmakers.dart';
import 'package:stopwatch/views/elapsedtime_text.dart';

class StopWatchRenderer extends StatelessWidget {
  final Duration elapsed;
  final double radius;

  const StopWatchRenderer(
      {Key? key, required this.elapsed, required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
              top: radius,
              left: radius,
              child: ClockSecondsTicker(seconds: i, radius: radius)),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
              top: radius,
              left: radius,
              child: ClockTextMarker(
                maxValue: 60,
                radius: radius,
                value: i,
              )),
        Positioned(
          top: radius,
          left: radius,
          child: ClockHand(
              rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
              handThickness: 2,
              handLength: radius,
              handColor: Colors.green),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
